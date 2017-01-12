setwd("~/Documents/thesis/Datasets/")

# Missing values are encoded with 9's
dt <- as.matrix(read.table("geno3pops.pcadapt"))
nIND <- ncol(dt)
nSNP <- nrow(dt)

# Total percentage of missing values 
mv.tot.p <- 0.05   
n.mv <- floor(nIND * nSNP * mv.tot.p)

# Uniform distribution of missing values
idx.row <- sample(1:nSNP, n.mv, TRUE)
idx.col <- sample(1:nIND, n.mv, TRUE)
mv.unif <- dt 
mv.unif[idx.row, idx.col] <- 9
write.table(mv.unif, paste0("mv_unif_", mv.tot.p, ".pcadapt"), row.names = FALSE, col.names = FALSE)

# Non-uniform distribution
p.affected <- 0.2
n.affected <- floor(p.affected * nSNP)
idx.affected <- unique(sample(1:nSNP, n.affected, TRUE))
idx.row <- sample(idx.affected, n.mv, TRUE)
idx.col <- sample(1:nIND, n.mv, TRUE)
mv.nunif <- dt
mv.nunif[idx.row, idx.col] <- 9
write.table(mv.nunif, paste0("mv_nunif_", mv.tot.p, ".pcadapt"), row.names = FALSE, col.names = FALSE)

