package com.sxt.bus.controller;

import com.sxt.sys.constast.SYSConstast;
import com.sxt.sys.utils.RandomUtils;
import com.sxt.sys.utils.WebUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("upload")
public class UploadFileController {
    /**
     * 图片上传
     */
    @RequestMapping("uploadFile")
    public Map<String,Object> uploadFile(MultipartFile mf){
        Map<String,Object> map=new HashMap<>();
        Integer code=SYSConstast.CODE_ERROR;
        String path="";
        //1,得到文件上传的目录
        String realPath=WebUtils.getServletContext().getRealPath("/upload");
        //2,得到文件夹的名字
        String dirName=RandomUtils.createDirFileNameUserTime();
        //3,构造文件夹对象
        File dirFile=new File(realPath,dirName);
        //4,判断文件夹是否存在
        if(!dirFile.exists()){
            dirFile.mkdirs();//创建文件夹
        }
        //5,得到文件名
        String oldName=mf.getOriginalFilename();
        //6,生成新的文件名
        String newName=RandomUtils.createFileNameUseTime(oldName);
        //7,构造文件对象
        File file=new File(dirFile, newName);
        //5,上传文件
        try {
            mf.transferTo(file);
            code=SYSConstast.CODE_OK;
            path="../upload/"+dirName+"/"+newName;
        } catch (IllegalStateException | IOException e) {
            e.printStackTrace();
        }
        map.put("code", code);
        map.put("path", path);
        return map;
    }

}

