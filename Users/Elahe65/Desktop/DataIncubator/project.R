# Loading Data
setwd("C:/Users/Elahe65/Desktop/DataIncubator")
data = read.csv("Data_Extract_From_World_Development_Indicators_Data.csv", na.strings="..")

# Cleaning Data
dataI1 = data[data$Country.Code=="IRN",]
dataU1 = data[data$Country.Code=="USA",]
dataI2 <- data.frame(dataI1[1:29,4:22])
dataU2 <- data.frame(dataU1[1:29,4:22])
dataI3 = data.frame(t(dataI2))
names(dataI3)<- c("SE.PRM.UNER","SE.PRM.UNER.FE","SE.PRM.UNER.MA","SL.TLF.PART.FE.ZS","SL.TLF.PART.MA.ZS","SL.EMP.SELF.FE.ZS","SL.EMP.SELF.MA.ZS","SL.EMP.SELF.ZS","SH.PRV.SMOK.FE","SH.PRV.SMOK.MA","SL.TLF.CACT.FE.NE.ZS","SL.TLF.ACTI.FE.ZS","SL.TLF.CACT.MA.ZS","SL.TLF.CACT.MA.NE.ZS","SL.TLF.ACTI.MA.ZS","SL.TLF.CACT.ZS","SL.TLF.CACT.NE.ZS","SL.TLF.CACT.FE.ZS","SL.TLF.ACTI.ZS","SE.PRM.TENR","SE.PRM.TENR.FE","SE.PRM.TENR.MA","SE.ADT.LITR.ZS","SE.ADT.LITR.FE.ZS","SE.ADT.LITR.MA.ZS","SP.POP.DPND","SP.POP.DPND.OL","SP.POP.DPND.YG") 
dataU3 = data.frame(t(dataU2))
names(dataU3)<- c("SE.PRM.UNER","SE.PRM.UNER.FE","SE.PRM.UNER.MA","SL.TLF.PART.FE.ZS","SL.TLF.PART.MA.ZS","SL.EMP.SELF.FE.ZS","SL.EMP.SELF.MA.ZS","SL.EMP.SELF.ZS","SH.PRV.SMOK.FE","SH.PRV.SMOK.MA","SL.TLF.CACT.FE.NE.ZS","SL.TLF.ACTI.FE.ZS","SL.TLF.CACT.MA.ZS","SL.TLF.CACT.MA.NE.ZS","SL.TLF.ACTI.MA.ZS","SL.TLF.CACT.ZS","SL.TLF.CACT.NE.ZS","SL.TLF.CACT.FE.ZS","SL.TLF.ACTI.ZS","SE.PRM.TENR","SE.PRM.TENR.FE","SE.PRM.TENR.MA","SE.ADT.LITR.ZS","SE.ADT.LITR.FE.ZS","SE.ADT.LITR.MA.ZS","SP.POP.DPND","SP.POP.DPND.OL","SP.POP.DPND.YG")
dataI3 <-dataI3[-1,] 
row.names(dataI3)<- substr(row.names(dataI3),10,13)
dataU3 <-dataU3[-1,] 
row.names(dataU3)<- substr(row.names(dataU3),10,13)

# plotting data for ratio of children out of primary school
IRN_tot = as.numeric(as.character(dataI3$SE.PRM.UNER))
IRN_FE = as.numeric(as.character(dataI3$SE.PRM.UNER.FE))
IRN_MA = as.numeric(as.character(dataI3$SE.PRM.UNER.MA))

USA_tot = as.numeric(as.character(dataU3$SE.PRM.UNER))
USA_FE = as.numeric(as.character(dataU3$SE.PRM.UNER.FE))
USA_MA = as.numeric(as.character(dataU3$SE.PRM.UNER.MA))

png("Fig1.png")                 
plot(row.names(dataI3), IRN_FE/IRN_MA, col = "blue", ylim =c(0,3.5),
     main = "ratio of female/male children out of primary school", xlab ="year", 
     ylab = "ratio", pch = 7)
points(row.names(dataI3), USA_FE/USA_MA, col="red", pch = 7)
legend("topright", col=c("blue","red"), legend=c("Iran","USA"))
dev.off()

# plotting the self-employed male and female in USA and Iran
USA_FE_Lit = as.numeric(as.character(dataU3$SE.ADT.LITR.FE.ZS))
USA_MA_Lit = as.numeric(as.character(dataU3$SE.ADT.LITR.MA.ZS))
USA_tot_Lit = as.numeric(as.character(dataU3$SE.ADT.LITR.ZS))

IRN_FE_Lit = as.numeric(as.character(dataI3$SE.ADT.LITR.FE.ZS))
IRN_MA_Lit = as.numeric(as.character(dataI3$SE.ADT.LITR.MA.ZS))
IRN_tot_Lit = as.numeric(as.character(dataI3$SE.ADT.LITR.ZS))

png("Fig2.png")
plot(row.names(dataI3), IRN_MA_Lit, col = "blue", ylim =c(40,100),
     main = "Literacy rate for adults in Iran", xlab ="year", 
     ylab = "ratio", pch = 3)
points(row.names(dataI3), IRN_FE_Lit, col = "red",pch = 3)
legend("topright",col=c("red","blue"),legend=c("Female","Male"))
dev.off()