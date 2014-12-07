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
png(filename = 'absorption_vs_lambda.png')
plot(lambda[lambda>200*10^-7 & lambda<1400*10^-7],(absor[lambda>200*10^-7 & lambda<1400*10^-7]),type="o",pch=20,xlab="lambda [cm]",ylab="Absorption coefficient [cm^-1]")
title("Absorption coefficient as a function of wavelength")
dev.off()
png(filename = 'absorption_vs_lambda_log10.png')
plot(lambda[lambda>200*10^-7 & lambda<1400*10^-7],log10(absor[lambda>200*10^-7 & lambda<1400*10^-7]),type="o",pch=20,xlab="lambda [cm]",ylab="Log_10 absorption coefficient [cm^-1]")
title("Log plot of absorption coefficient as a function of lambda")
dev.off()
table <- as.table(matrix(c(lambda,absor),ncol=2),row.names=NULL)
write.table(table, "absorption_vs_lambda.dat", sep="\t",row.names = F, col.names = F)
