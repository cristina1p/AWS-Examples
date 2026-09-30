package com.example.aws;

import software.amazon.awssdk.regions.Region;
import software.amazon.awssdk.services.s3.S3Client;
import software.amazon.awssdk.services.s3.model.ListBucketsResponse;

public class App {
    public static void main(String[] args) {
        S3Client s3 = S3Client.builder()
                .region(Region.US_EAST_1)
                .build();

        ListBucketsResponse response = s3.listBuckets();
        System.out.println("Found " + response.buckets().size() + " buckets.");
        
        s3.close();
    }
}