imag<-read.table("imag.dat")
real<-read.table("real.dat")
energy = real[[1]]
h = 4.135668e-15
c = 2.99792458e8
e1 = real[[2]]
e2 = imag[[2]]
k <- sqrt((sqrt(e1^2+e2^2)-e1)/2)
lambda <- ((h*c)/energy)*10^2
omega <- energy/(h/(2*pi))
absor <- 4*pi*k/lambda 
png(filename = 'tauc_r0.5.png')
plot(energy[energy>0 & energy < 5.0],((energy[energy>0 & energy < 5.0]*absor[energy>0 & energy < 5.0])^0.5),type="o",pch=20,xlab="Energy [eV]",ylab = "(alpha*h*nu)^0.5 (cm^-0.5)")
title("Tauc plot")
dev.off()
table <- as.table(matrix(c(energy[energy>0 & energy < 5.0],(energy[energy>0 & energy < 5.0]*absor[energy>0 & energy < 5.0])^0.5),ncol=2),row.names=NULL)
write.table(table, "tauc_r0.5.dat", sep="\t",row.names = F, col.names = F)

