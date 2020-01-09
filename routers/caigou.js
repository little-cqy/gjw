const express=require('express');
const pool=require('../pool.js');
let router=express.Router();

// 提交采购信息
router.post('/v1/cgadd',function(req,res){
    let obj=req.body;
    console.log(obj);
    pool.query('insert into gjw_caigou set ?',[obj],function(err,result){
        if(err) throw err;
        if(result.affectedRows>0){
            res.send('1');
        }else{
            res.send('0')
        }
    });
});
module.exports=router;