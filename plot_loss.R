imag<-read.table("imag.dat")
real<-read.table("real.dat")
energy = real[[1]]
h = 4.135668e-15
c = 2.99792458e8
e1 = real[[2]]
e2 = imag[[2]]
lambda <- ((h*c)/energy)*10^2
loss <- e2/(e1^2+e2^2)
png(filename = 'loss_vs_energy.png')
plot(energy[energy>0 & energy < 5.0],(loss[energy>0 & energy < 5.0]),type="o",pch=20,xlab="Energy [eV]",ylab="Loss")
title("Loss function v. energy")
dev.off()
png(filename = 'loss_vs_lambda.png')
plot(lambda[lambda > 200*10^-7 & lambda<1200*10^-7],(loss[lambda > 200*10^-7 & lambda<1200*10^-7]),type="o",pch=20,xlab="lambda [cm]",ylab="Loss")
title("Loss function v. wavelength")
dev.off()
table <- as.table(matrix(c(energy,loss),ncol=2),row.names=NULL)
write.table(table, "Loss_vs_energy.dat", sep="\t",row.names = F, col.names = F)
