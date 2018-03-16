# Esta en C:\Users\Estadistica\Dropbox\Varios\Autoayuda R\Ejemplos

# oring.challenger <- read.table ("challenger_data.txt",header=TRUE, sep="")
oring.challenger<- read.delim2("clipboard")
o_ring.model <- glm(falla~temp, family=binomial, data=oring.challenger)
summary(o_ring.model)

pred_prob <- o_ring.model$fit
eta_hat <- o_ring.model$linear.predictor
dev_res <-residuals(o_ring.model, c="deviance")
influence.measures(o_ring.model)
df <- dfbetas(o_ring.model)
df_int <- df [,1]
df_temp <- df [,2]
hat <- hatvalues(o_ring.model)
qqnorm(dev_res)
plot(pred_prob,dev_res)
plot (eta_hat,dev_res)
plot(o_ring$temp,dev_res)
plot(hat,dev_res)
plot(pred_prob/df_temp)
plot(hat,df_temp)
o_ring2 <- cbind(oring.challenger,pred_prob,eta_hat,dev_res, df_int,df_temp,hat)
write.table(o_ring2, "E:\\Autoayuda\\challenger_output.txt")