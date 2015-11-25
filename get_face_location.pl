#!/usr/bin/perl

use strict;
use XML::Simple;
use Data::Dumper;

my $output = XMLin('out2.txt');

#print Dumper($output);


for (my $count = 0; $count < 10 ;$count++){
	my $faceId="$output->{faceRecognition}->{verificationFaceInfo}[$count]->{candidate}{faceId}\n";
	my $faceConfidence="$output->{faceRecognition}->{verificationFaceInfo}[$count]->{faceCoordinates}{faceConfidence}\n";
	my $faceFrameTopY="$output->{faceRecognition}->{verificationFaceInfo}[$count]->{faceCoordinates}{faceFrameTopY}\n";
	my $faceFrameBottomY="$output->{faceRecognition}->{verificationFaceInfo}[$count]->{faceCoordinates}{faceFrameBottomY}\n";
	my $faceFrameLeftX="$output->{faceRecognition}->{verificationFaceInfo}[$count]->{faceCoordinates}{faceFrameLeftX}\n";
	my $faceFrameRightX="$output->{faceRecognition}->{verificationFaceInfo}[$count]->{faceCoordinates}{faceFrameRightX}\n";
	if($faceId != ""){
	    if($faceId == 8){
		print "=========start========\n";
		print  "faceId:$faceId\n";
		print  "\n";
		print  "faceConfidence:$faceConfidence\n";
		print  "faceFrameTopY:$faceFrameTopY\n";
		print  "faceFrameBottomY:$faceFrameBottomY\n";
		print  "faceFrameLeftX:$faceFrameLeftX\n";
		print  "faceFrameRightX:$faceFrameRightX\n";
		print "==========end=========\n";
	    }
	}

}
