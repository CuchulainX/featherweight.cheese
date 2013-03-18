PG 1       ' begin programLB SU      ' start here on powerupEM=2       ' turn off promptHC=0       ' hold currentST=0       ' clear stall flagSF=30      ' stall factorEE=1       ' enable the encoderSM=0       ' halt on stall detectPR         ' print newline for scanimageA=30000    ' accelerationD=200000   ' decelerationP=0        ' positionD1=20      ' input 1 debounce to 20msecH 1500     ' wait for calibrationH 5000     ' throw out first hard to time scanPR         ' print newline for scanimageLB G1      ' infinite loop begins here           ' scanbarS1=5,0,1   ' halt if paper presentVM=5520    ' match scanning rateMA -50800  ' towards endH 3250     ' dead reckoningBR G2,ST=1 ' halt if stalled           ' move to slotsVM=24000   ' fastMA -50800  ' towards endH 800      ' dead reckoningBR G2,ST=1 ' halt if stalled           ' slotsVM=12000   ' slow MA -50800  ' towards endH          ' go all the wayBR G2,ST=1 ' halt if stalled           ' page turnVM=2600    ' very slowMA 10      ' towards beginningH 3700     ' dead reckoningBR G2,ST=1 ' halt if stalled           ' page splitS1=0,1,1   ' ignore break beam sensorVM=12000   ' slow MA 10      ' towards beginningH 1000     ' dead reckoningBR G2,ST=1 ' halt if stalled           ' page in slotS1=5,1,1   ' halt if paper absentVM=24000   ' fastMA 10      ' towards beginningH 100      ' dead reckoningBR G2,ST=1 ' halt if stalled           ' clear the sensor areaS1=0,1,1   ' ignore break beam sensorMA 10      ' towards beginningH 1000     ' dead reckoningBR G2,ST=1 ' halt if stalled           ' back to startS1=5,0,1   ' halt if paper presentMA 10      ' towards beginningH          ' go all the wayBR G2,ST=1 ' halt if stalledPR         ' print newline for scanimageBR G1      ' loop foreverLB G2      ' bail out regionE          ' halt program executionPG         ' end program