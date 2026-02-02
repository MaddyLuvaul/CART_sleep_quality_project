# Optimisation through pruning 

printcp(fit.tree.groupedocc)

# Request cp value which minimises xerror  
bestcp = fit.tree.groupedocc$cptable[which.min(fit.tree.groupedocc$cptable[,"xerror"]),"CP"]

# Prune tree
pruned.tree <- prune(fit.tree.groupedocc, cp = bestcp)
