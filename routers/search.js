const express=require('express');
const pool=require('../pool.js');
let router=express.Router();

router.get('/v1/search/:title',function(req,res){
  let obj=req.params;
  pool.query('select * from gjw_laptop where title like ?',[`%${obj.title}%`],function(err,result){
    if(err) throw err;
    if(result.length>0){
      res.send({code:200,msg:result});
    }else{
      res.send('0');
    }
  })
});

router.get('/v1/searchAll',function(req,res){
  pool.query('select * from gjw_laptop',function(err,result){
    if(err) throw err;
    if(result.length>0){
      res.send({code:200,msg:result});
    }else{
      res.send('0');
    }
  })
});

module.exports=router;