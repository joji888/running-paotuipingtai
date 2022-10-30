<template>
    <div>
        <top @onIndex="onIndex"></top>

        <div class="userInfo">

            <van-uploader v-model="fileList" multiple :before-read="afterRead" :max-count="1" style="border: 1px solid white;margin-top: 30px;margin-left: 30px;float: left">
                <van-image
                    v-show="true"
                    width="80"
                    height="80"
                    radius="80"
                    :src="userImg"
                />
            </van-uploader>

            <div style="border: 1px solid white;margin-top: 40px;margin-left: 30px;float: left;padding-top: 5px">
                <div style="font-size: 12px">{{user.unick}}</div>
                <van-tag plain type="primary" style="margin-top: 10px" color="#ff9094">{{user.uRole}}</van-tag>
            </div>

            <van-button round type="info" style="float: right;margin-top: 55px;font-size: 10px;height: 28px;margin-right: 30px">编辑资料</van-button>
        </div>
        <div style="padding-right: 30px;padding-left: 30px;font-size: 10px;color: #cccccc;margin-bottom: 20px;margin-top: 10px;">
            <span>发布跑腿：{{100000}}</span>
            <span style="float: right">接受跑腿：{{100000}}</span>
        </div>


        <van-cell title="接单者认证" is-link style="color: #989898;padding-left: 30px;padding-right: 30px"/>
        <van-cell title="我的订单" is-link style="color: #989898;padding-left: 30px;padding-right: 30px"/>
        <van-cell title="我的接单" is-link style="color: #989898;padding-left: 30px;padding-right: 30px"/>


        <van-empty description="每天跑跑腿，天天好心情" />


    </div>

</template>

<script>
    import top from "./top";
    export default {
        components:{top},
        name: "home",
        data(){
            return{
                user:{},
                userImg:'',
                issueShow:false
            }
        },
        methods:{
            onIndex(){
                this.$emit("onIndex");
            },
            addOrderF(){
                this.issueShow=true;
            },
            closeAddOrder(){
                this.issueShow=false;
            },
            afterRead(file){
                console.log(file);
                let param = new FormData(); // 创建form对象
                param.append("uploadFIle",file); // 通过append向form对象添加数据
                param.append("uId",this.user.uid); // 通过append向form对象添加数据
                param.append("uHeadImg",this.user.uheadImg); // 通过append向form对象添加数据


                
                let config = {
                    headers: { "Content-Type": "multipart/form-data" }
                };

                let _this=this
                this.$http.post("/user/editImg", param, config).then(function (res) {
                    console.log(res);
                    if (res.data.code==200) {
                        _this.user.uheadImg=res.data.message
                        _this.userImg='../'+res.data.message
                        localStorage.setItem("user",JSON.stringify(_this.user));

                    }
                })


            }
        },
        mounted() {
            this.user=JSON.parse(localStorage.getItem("user"));
            if (this.user!=null&&this.user.uheadImg!=null&&this.user.uheadImg!==""){
                this.headImg=true;
            }
            this.userImg='../'+this.user.uheadImg
        }
    }
</script>

<style scoped>
    .myBackground{
        width: 100%;
        height: 10vh;
        background-color: cadetblue;
    }
    .userInfo{
        height: 120px;
    }
</style>
