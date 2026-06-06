BEGIN{
recvs = 0;
routing_packets = 0;
}

{
if (( $1 == "r") &&  ( $35 == "cbr" ) && ( $19=="AGT" ))  recvs++;
if (($1 == "s" || $1 == "f") && $19 == "RTR" && $35 =="AODV" )   routing_packets++;
}

END{
printf("NRL = %.3f", routing_packets/recvs);
}
