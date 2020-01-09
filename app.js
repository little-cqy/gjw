const express=require('express');
const bodyParse=require('body-parser');

//用户路由
let userRouter=require('./routers/user.js');
//商品路由
let proRouter=require('./routers/product.js');
//评价路由
let comRouter=require('./routers/comment.js');
//采购路由
let cgRouter=require('./routers/caigou.js');
//检索路由
let jsRouter=require('./routers/search.js');
//轮播图路由
let slideRouter=require('./routers/slide.js');

let app=express();
app.listen(8080);

app.use(express.static('public'));
app.use(bodyParse.urlencoded({
    extended:false
}))

//挂载路由器
app.use('/user',userRouter);
app.use('/pro',proRouter);
app.use('/com',comRouter);
app.use('/cg',cgRouter);
app.use('/js',jsRouter);
app.use('/slide',slideRouter);