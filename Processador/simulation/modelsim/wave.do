view wave 
wave clipboard store
wave create -driver freeze -pattern random -initialvalue 00000000 -period 5ps -random_type Uniform -seed 5 -range 7 0 -starttime 0ns -endtime 1000ns sim:/proc8bits/a 
WaveExpandAll -1
wave create -driver freeze -pattern random -initialvalue 00000000 -period 5ns -random_type Uniform -seed 5 -range 7 0 -starttime 0ns -endtime 1000ns sim:/proc8bits/b 
WaveExpandAll -1
wave create -driver freeze -pattern repeater -initialvalue 000 -period 5ns -sequence { 000 001  } -repeat forever -range 2 0 -starttime 0ns -endtime 1000ns sim:/proc8bits/op 
WaveExpandAll -1
wave modify -driver freeze -pattern random -initialvalue 00000000 -period 5ns -random_type Uniform -seed 7 -range 7 0 -starttime 0ns -endtime 1000ns Edit:/proc8bits/b 
wave modify -driver freeze -pattern random -initialvalue 00000000 -period 50ns -random_type Uniform -seed 7 -range 7 0 -starttime 0ns -endtime 1000ns Edit:/proc8bits/b 
wave modify -driver freeze -pattern counter -startvalue 00001111 -endvalue 11111111 -type Range -direction Up -period 50ns -step 1 -repeat forever -range 7 0 -starttime 0ns -endtime 1000ns Edit:/proc8bits/b 
wave modify -driver freeze -pattern random -initialvalue 00000000 -period 5ns -random_type Uniform -seed 5 -range 7 0 -starttime 0ns -endtime 1000ns Edit:/proc8bits/a 
WaveCollapseAll -1
wave clipboard restore
