const express=require('express');
const pool=require('../pool');
let router=express.Router();

//分类查询商品列表
router.get('/v1/productClass/:family_id',function(req,res){
    let obj=req.params;
    //SELECT ename,dname FROM emp INNER JOIN dept ON deptId=did;
    var sql="select *,one from gjw_laptop inner join gjw_laptop_pic on lid=laptop_id where family_id=?";
    pool.query(sql,[obj.family_id],function(err,result){
        if(err) throw err;
        if(result.length>0){
            res.send({code:'1',msg:result});
            console.log(result);
        }else{
            res.send('0');
        }
    })
});

// 首页商品列表查询
router.get('/v1/productIndex',function(req,res){
    pool.query('select * from gjw_index_product',function(err,result){
        if(err) throw err;
        if(result.length>0){
            res.send({code:'1',msg:result});
        }else{
            res.send('0');
        }
    })
})

// 商品详情页查询单个商品 详情文字/图片/评价
router.get('/v1/productDetail/:lid',function(req,res){
    let obj=req.params;
    var sql='select *,one,two,three,four,five from gjw_laptop inner join gjw_laptop_pic on lid=laptop_id where lid=?';
    pool.query(sql,[obj.lid],function(err,result){
        if(err) throw err;
        if(result.length>0){
            res.send({code:200,msg:result})
        }else{
            res.send("0");
        }
    })
});

// 查询商品详情页面包屑
router.get('/v1/productFamily/:lid',function(req,res){
    let obj=req.params;
    var sql=`
        select family.name,family.fid,title from gjw_laptop
        inner join gjw_laptop_family family on family.fid=family_id
        where lid=?
    `;
    pool.query(sql,[obj.lid],function(err,result){
        if(err) throw err;
        if(result.length>0){
            res.send({code:200,msg:result});
        }else{
            res.send('0');
        }
    })
});

// 查询商品种类
router.get('/v1/productFamilyName/:fid',function(req,res){
    var sql=`select * from gjw_laptop_family where fid=?`;
    pool.query(sql,[req.params.fid],function(err,result){
        if(err) throw err;
        if(result.length>0){
            res.send({code:200,msg:result});
        }else{
            res.send('0');
        }
    })
});

// 查询商品分类下的品牌名称
router.get('/v1/productBrand/:fid',function(req,res){
    var sql=`select * from gjw_laptop_family_detail where fid=?`;
    pool.query(sql,[req.params.fid],function(err,result){
        if(err) throw err;
        if(result.length>0){
            res.send({code:200,msg:result});
        }else{
            res.send('0');
        }
    });
});

module.exports=router;

