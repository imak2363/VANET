#!/usr/bin/perl
$tracefile=$ARGV[0];
$granularity=$ARGV[1];



#ouput file. You should change this line according to your output file folder...Abdusy modified
$ofile="/home/ovi/vanet/uttara.tr";
open OUT, ">$ofile" or die "$0 cannot open output file $ofile: $!";

#my @pausetime = (10,50,100,200,400,600);
open (DR,STDIN);
$gclock=0;

#Init Data Packet Information
$dataSent = 0;
$dataRecv = 0;
$routerDrop = 0;
$aodvDataSent = 0;

#Init Routing Overhead & End-to-End Delay .............................Abdusy Added
$routingOverHead = 0;
$e2eDelay = 0 ;

#Init for counting end-to-end delay.............................Abdusy Added
$timesent = 0;
$timereceived = 0;
$timeav = 0;
$timeall = 0;
$idsent = 0;
$time = 0;

#Data Packet from Ad hoc-Host .............................Abdusy Added
$dataA2H = 0;
$dataH2A = 0;

#AODV Message Packet Information
$aodvSent = 0;
$aodvRecv = 0;

$aodvSentRequest = 0;
$aodvRecvRequest = 0;
$aodvDropRequest = 0;

$aodvSentReply = 0;
$aodvRecvReply = 0;
$aodvDropReply = 0;

$routerDropRequest = 0;
$routerDropReply = 0;

#loop...........................................for read trace file : Abdusy modified
foreach $pausetime (@pausetime) {

if ($granularity==0) {$granularity=30;}

while(<>){
#while ($line) [
chomp;
#chomp $line;

#To split text in line .......................................Abdusy modified
($status, $t, $time, $data) = split ("t");
if (/^s/){
if (/^s.*AODV/) {
$aodvSent++;
if (/^s.*REQUEST/) {
$aodvSendRequest++;
}
elsif (/^s.*REPLY/) {
$aodvSendReply++;
}
#elsif (/^s.*AGT/) {
#	$aodvDataSent++;
#}
}
#elsif (/^s.*cbr/) {
elsif (/^s.*AGT/ && /^s.*8388609/ && /^s.*4194305*/ && /^s.*cbr/) {
#elsif (/^s.*AGT/ && /^s.*4194305/ && /^s.*8388609*/ && /^s.*cbr/) {
#elsif (/^s.*AGT/ && /^s.*cbr/) {
$dataSent++;
}

}
#condition for counting routing over head....................Abdusy Added
elsif (/^f.*RTR/) {
$routingOverHead++;

}

elsif (/^r/){
if (/^r.*AODV/) {
$aodvRecv++;
if (/^r.*REQUEST/) {
$aodvRecvRequest++;
}
elsif (/^r.*REPLY/) {
$aodvRecvReply++;
}
}
# For old Trace Format ------------------------------ ABDUSY : Modified
#elsif (/^r.*AGT/ && /^r.*cbr/) {
# For new Trace Format
elsif (/^r.*0 1.*cbr/) {
$dataRecv++;
if (($spl[46] eq $idsent)) {
$received++;
}
}
#print OUT "$pausetime t "."$aodvSent t"."$aodvRecv t". (($aodvSent != 0)?$aodvRecv /$aodvSent: 0)*100 ."n";

} elsif (/^D/) {
if (/^D.*AODV/) {
if (/^D.*REQUEST/) {
$aodvDropRequest++;
}
elsif (/^D.*REPLY/) {
$aodvDropReply++;
}

}
if (/^D.*RTR/) {
$routerDrop++;
}

}
#.............................Abdusy

}
# end if
}
# end for

close DR;

#Calculate packet delivery ratio
$delivery_ratio = (100*$dataRecv/$dataSent)		;

#Calculate routing over head = sum of aodv message x besar paket yaitu 48 byte dibagi waktu simulasi........Abdusy Added
$routingOverHead = (($routingOverHead + $aodvSent + $aodvRecv )* 48)/600;

#Calculate end-to-end delay .................................................Abdusy Added
#$timeav=$timesent/$dataRecv;

print " n";
print " ##############################n";
print " #  *** ANALYZE & RESULT ***  #n";
print " ##############################n";
print " n";
print "AODV Sent		: $aodvSent packets n";
print "   AODV Sent Request	: $aodvSentRequestn";
print "   AODV Sent Reply	: $aodvSentReplyn";
print "------------------------------------n";
print "AODV Recv		: $aodvRecv packetsn";
print "   AODV Recv Request	: $aodvRecvRequestn";
print "   AODV Recv Reply	: $aodvRecvReplyn";
print "------------------------------------n";
print "Data Sent		: $dataSent packetsn";
print "Data Recv		: $dataRecv packetsn";
print "------------------------------------n";
print "Router Drop		: $routerDrop packetsn";
print "------------------------------------n";
print "Packet Delivery Ratio	: $delivery_ratio % n";
print "Routing Over Head	: $routingOverHead bytes per second n";
print " n";
print " n";

close OUT;

###############################################################################
# This script is modified from analyze.pl from Elmurod.net
# to use this script, you have to copy to /usr/bin
# and do "chmod 777 /usr/bin/analyze.pl"
# To analyze trace file just run "cat trace-file.tr | analyze.pl"
###############################################################################l
