const express=require('express');
let pool=require('../pool');
let router=express.Router();

// 查询某个商品的评价
router.get('/v1/comList/:id',function(req,res){
    let obj=req.params;
    var sql=`
        select *,user.phone from gjw_comment as com
        join gjw_user as user on user.uid=com.user_id
        where com.laptop_id=?
    `;
    pool.query(sql,[obj.id],function(err,result){
        if(err) throw err;
        if(result.length>0){
            res.send({code:200,msg:result});
        }else{
            res.send('0');
        }
    })
});

module.exports=router;