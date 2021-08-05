oneone <- 0
onetwo <- 0
onethree <- 0
twoone <- 0
twotwo <- 0
twothree <- 0
threeone <- 0
threetwo <- 0
threethree <- 0

for (i in 1:1259)
{if((SCD5Y$P_Change[i] >= -1.0) && (SCD5Y$P_Change[i] <= 1.0)) {SCD5Y$E_State[i] = 1}
  if(SCD5Y$P_Change[i] > 1.0) {SCD5Y$E_State[i] = 2}
  if(SCD5Y$P_Change[i] < -1.0) {SCD5Y$E_State[i] = 3}
}

for(j in 2:1259){
  SCD5Y$S_State[j] = SCD5Y$E_State[j-1]}

for(k in 1:1259){
  if((SCD5Y$S_State[k] == 1) &&  (SCD5Y$E_State[k] == 1)){oneone <- oneone +1}
  if((SCD5Y$S_State[k] == 1) &&  (SCD5Y$E_State[k] == 2)){onetwo <- onetwo +1}
  if((SCD5Y$S_State[k] == 1) &&  (SCD5Y$E_State[k] == 3)){onethree <- onethree +1}
}

for(l in 1:1259){
  if((SCD5Y$S_State[l] == 2) &&  (SCD5Y$E_State[l] == 1)){twoone <- twoone +1}
  if((SCD5Y$S_State[l] == 2) &&  (SCD5Y$E_State[l] == 2)){twotwo <- twotwo +1}
  if((SCD5Y$S_State[l] == 2) &&  (SCD5Y$E_State[l] == 3)){twothree <- twothree +1}
}

for(m in 1:1259){
  if((SCD5Y$S_State[m] == 3) &&  (SCD5Y$E_State[m] == 1)){threeone <- threeone +1}
  if((SCD5Y$S_State[m] == 3) &&  (SCD5Y$E_State[m] == 2)){threetwo <- threetwo +1}
  if((SCD5Y$S_State[m] == 3) &&  (SCD5Y$E_State[m] == 3)){threethree <- threethree +1}
}

tone <- oneone + onetwo +onethree
ttwo <- twoone + twotwo + twothree
tthree <- threeone + threetwo + threethree

rowone <- c(oneone/tone, onetwo/tone, onethree/tone)
rowtwo <- c(twoone/ttwo, twotwo/ttwo, twothree/ttwo)
rowthree <- c(threeone/tthree, threetwo/tthree, threethree/tthree)

tmatrix <- rbind(rowone, rowtwo, rowthree)
tmatrix