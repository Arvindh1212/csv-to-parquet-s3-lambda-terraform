import boto3
import pandas as pd
import pyarrow as pa
import pyarrow.parquet as pq
import io
import os

s3 = boto3.client('s3')
sns = boto3.client('sns')
sns_topic_arn = os.environ.get('SNS_TOPIC_ARN') 

def lambda_handler(event, context):
    # Get the bucket and object key from the event
    bucket = event['Records'][0]['s3']['bucket']['name']
    key = event['Records'][0]['s3']['object']['key']

    print(f"Trying to get object from bucket: {bucket}, key: {key}")

    
    # Download the CSV file from S3
    csv_obj = s3.get_object(Bucket=bucket, Key=key)
    csv_content = csv_obj['Body'].read().decode('utf-8')
    
    # Read the CSV file into a pandas DataFrame
    df = pd.read_csv(io.StringIO(csv_content))
    
    # Convert the DataFrame to a Parquet file
    table = pa.Table.from_pandas(df)
    
    # Prepare the Parquet file to upload
    parquet_buffer = io.BytesIO()
    pq.write_table(table, parquet_buffer)
    parquet_buffer.seek(0)
    
    # Define the new S3 object key for the Parquet file
    parquet_key = key.replace('.csv', '.parquet')
    
    # Upload the Parquet file to S3
    s3.put_object(Bucket='parquet-destination-bucket-arvind-123', Key=parquet_key, Body=parquet_buffer.getvalue())

    sns.publish(
    TopicArn=sns_topic_arn,
    Subject='S3 File Conversion Complete',
    Message='File has been converted as Parquet and uploaded to S3.'
)
    
    return {
        'statusCode': 200,
        'body': f'Successfully converted {key} to {parquet_key}'
    }

'''

csv_obj = s3.get_object(Bucket=bucket, Key=key)
df = pd.read_csv(csv_obj['Body'])

import pandas as pd

df = pd.read_csv(csv_obj['Body'])

'''