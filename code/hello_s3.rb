#!/usr/bin/env ruby

require 'rubygems'
require 'aws/s3'
include AWS::S3

AWS::S3::Base.establish_connection!(
    :access_key_id     => ENV['AMAZON_ACCESS_KEY_ID'],
    :secret_access_key => ENV['AMAZON_SECRET_ACCESS_KEY']
)

bucket = ARGV[0]
file = ARGV[1]

Bucket.create(bucket)
S3Object.store(file, File.open(file), bucket)