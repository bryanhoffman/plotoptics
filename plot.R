imag<-read.table("imag.dat")
real<-read.table("real.dat")
energy = real[[1]]
h = 4.135668e-15
c = 2.99792458e8
e1 = real[[2]]
e2 = imag[[2]]
k <- sqrt((sqrt(e1^2+e2^2)-e1))
lambda <- ((h*c)/energy)*10^2
omega <- energy/(h/(2*pi))
absor <- 4*pi*k/lambda 
png(filename = 'absorption_vs_energy.png')
plot(energy[energy>0 & energy < 5.0],(absor[energy>0 & energy < 5.0]),type="o",pch=20,xlab="Energy [eV]",ylab="Absorption coefficient [cm^-1]")
title("Absorption coefficient as a function of energy")
dev.off()
png(filename = 'absorption_vs_energy_log10.png')
plot(energy[energy>0 & energy < 5.0],log10(absor[energy>0 & energy < 5.0]),type="o",pch=20,xlab="Energy [eV]",ylab="Log_10 absorption coefficient [cm^-1]")
title("Log plot of absorption coefficient as a function of energy")
dev.off()
table <- as.table(matrix(c(energy,absor),ncol=2),row.names=NULL)
write.table(table, "absorption_vs_energy.dat", sep="\t",row.names = F, col.names = F)
