matrix1<-read.csv("IMDb movies.csv")
matrix2<- matrix1[matrix1$votes>=500, ]
matrix3<- matrix2[matrix2$avg_vote>=7, ]
getmode<-function(x){
  uniqx<-unique(x)
  uniqx[which.max(tabulate(match(x,uniqx)))]
}
x<- getmode(matrix3$year)
print(paste('the best year is', x) )
matrix4 <- subset(matrix3, select = -c(imdb_title_id, actors, description, original_title, genre, director, writer, production_company, usa_gross_income, worlwide_gross_income, date_published))
#if(matrix4$year = x){
  #print(matrix4[x, ])
#}
vec<-matrix4$avg_vote*matrix4$votes
new<-cbind(matrix4, points = vec)
rownames(new) = 1:nrow(new)
bestmovie<- new[which.max(new$points), ]
print( bestmovie)
