const express=require('express');
const pool=require('../pool');
let router=express.Router();

//用户登陆路由
router.get('/v1/login/:uname&:upwd',function(req,res){
    let obj=req.params;
    pool.query('select * from gjw_user where uname=? and upwd=?',[obj.uname,obj.upwd],function(err,result){
        if(err) throw err;
        if(result.length>0){
            res.send({code:200,msg:result});
        }else{
            res.send('0');
        }
    })
});
//用户注册路由
router.post('/v1/reg',function(req,res){
    console.log('req'+req);
    let obj=req.body;
    console.log(obj);
    pool.query('insert into gjw_user set ?',[obj],function(err,result){
        if(err) throw err;
        if(result.affectedRows>0){
            res.send('1');
        }else{
            res.send('0');
        }
    })
});

module.exports=router;