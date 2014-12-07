imag<-read.table("imag.dat")
real<-read.table("real.dat")
energy = real[[1]]
h = 4.135668e-15
c = 2.99792458e8
e1 = real[[2]]
e2 = imag[[2]]
k <- sqrt((sqrt(e1^2+e2^2)-e1)/2)
n <- sqrt((sqrt(e1^2+e2^2)+e1)/2)
lambda <- ((h*c)/energy)*10^2
reflec <- ((n-1)^2+k^2)/((n+1)^2+k^2)
png(filename = 'reflection_vs_energy.png')
plot(energy[energy>0 & energy < 5.0],(reflec[energy>0 & energy < 5.0]),type="o",pch=20,xlab="Energy [eV]",ylab="Reflectivity")
title("Reflectivity as a function of energy")
dev.off()
png(filename = 'reflection_vs_lambda.png')
plot(lambda[lambda > 200*10^-7 & lambda<1200*10^-7],(reflec[lambda > 200*10^-7 & lambda<1200*10^-7]),type="o",pch=20,xlab="lambda [cm]",ylab="Reflectivity")
title("Reflectivity as a function of wavelength")
dev.off()
table <- as.table(matrix(c(energy,reflec),ncol=2),row.names=NULL)
write.table(table, "reflection_vs_energy.dat", sep="\t",row.names = F, col.names = F)
