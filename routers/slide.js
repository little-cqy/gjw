const express=require('express');
let pool=require('../pool.js');
let router=express.Router();

// 获取轮播图
router.get('/v1/slideBar',function(req,res){
  pool.query('select * from gjw_index_carousel',function(err,result){
    if(err) throw err;
    if(result.length>0){
      res.send({code:200,msg:result});
    }else{
      res.send("0");
    }
  })
});

module.exports=router;