set ns [new Simulator]
set nf [open nslab1.nam w]
$ns namtrace-all $nf
set tf [open lab1.tr w]
$ns trace-all $tf
proc finish {} {
	global ns nf tf
	$ns flush-trace
	close $nf
	close $tf
	exec nam nslab1.nam &
	exit 0
}
set n1 [$ns node]
set n2 [$ns node]
set n3 [$ns node]

$ns duplex-link $n1 $n2 1MB 100ms DropTail
$ns duplex-link $n2 $n3 1MB 100ms DropTail
$ns set queue-limit $n1 $n2 5
$ns set queue-limit $n2 $n3 3

set udp1 [new Agent/UDP]
$ns attach-agent $n1 $udp1

set cbr1 [new Application/Traffic/CBR]
$cbr1 attach-agent $udp1

set udp2 [new Agent/UDP]
$ns attach-agent $n2 $udp2

set cbr2 [new Application/Traffic/CBR]
$cbr2 attach-agent $udp2

set null3 [new Agent/Null]
$ns attach-agent $n3 $null3

$ns connect $udp1 $null3
$ns connect $udp2 $null3

$cbr1 set packetSize_ 5000
$cbr1 set interval_ 0.001
$cbr2 set packetSize_ 5000
$cbr2 set interval_ 0.001
$ns at 0.1 "$cbr1 start"
$ns at 0.2 "$cbr2 start"
$ns at 4.5 "$cbr1 stop"
$ns at 4.5 "$cbr2 stop"
$ns at 0.5 "finish"

$ns run 

















