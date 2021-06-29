	program hw1
	implicit none
	character(len=75)::string
	character(len=2)::separate
	character(len=1)::quality
	character(len=10)::cwb
	integer::lat, long, error, i, number, counter, j, year 
	open(70,file="list.txt")
	do j=1991, 2000
	do i=01, 12
	write(70,"(I4,I2.2,A4)")j,i,".cwb"
	end do
	end do
	close(70)
	open(70,file="list.txt",status="old")
	open(60,file="new.txt")
	endfile(60)
	do i=1, 120
	read(70,"(A10)")cwb
	open(90,file=cwb,status="old")
	open(10,file=cwb,status="old")
	open(20,file=cwb,status="old")
	open(30,file=cwb,status="old")
	open(40,file=cwb,status="old")
	open(50,file=cwb,status="old")
	do while (.true.)
	read(90,"(I2)",iostat=error)year
	read(10,"(63X,A1)",iostat=error)quality	
	read(20,"(15X,I2)",iostat=error)lat
	read(30,"(22X,I3)",iostat=error)long
	if(lat>=23 .and. lat<24 .and. long>=120 .and. long<122)then
	do while (.true.)
	read(40,"(A75)",iostat=error)string
	read(50,"(2X,A2)",iostat=error)separate
	write(60,"(A75)")string
	if(separate=="**")exit
	end do
	else if(quality=="A" .or. quality=="B" .or. quality=="C" .or. quality=="D" .or. year==99)then
	do while (.true.)
	read(40,"(A75)",iostat=error)string
	read(50,"(2X,A2)",iostat=error)separate
	if(separate=="**")exit
	end do
	end if
	if(error/=0)exit
	end do
	read(40,"(A75)",iostat=error)string
	read(50,"(2X,A2)",iostat=error)separate
	write(60,"(A75)")string
	close(10)
	close(20)
	close(30)
	close(40)
	close(50)
	end do
	close(60)   
	close(70,status="delete")
	open(60,file="new.txt",status="old")
	open(80,file="temporary.txt")
	do i=1, 700000
	read(90,"(I2)",iostat=error)year
	read(60,"(63X,A1)",iostat=error)quality
	if(quality=="A" .or. quality=="B" .or. quality=="C" .or. quality=="D" .or. year==99)then
	write(80,"(I6)")i
	end if
	if(error/=0)exit
	end do
	close(60)
	close(80)
	open(80,file="temporary.txt",status="old")
	do i=1, 100000
	read(80,"(I6)",iostat=error)number
	counter=i-1
	write(*,*)counter
	if(error/=0)exit
	end do
	close(60)
	close(80,status="delete")	
	stop
	end