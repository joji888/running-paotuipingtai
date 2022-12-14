package cn.edu.jsu.zjj.running.config;

import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import java.io.File;
import java.io.IOException;

@Configuration
public class MyConfig implements WebMvcConfigurer {

    @Override
    public void addCorsMappings(CorsRegistry registry) {
        registry.addMapping("*")
                .allowedMethods("GET","PUT","POST","DELETE")
                .allowedOriginPatterns("*")
                .allowCredentials(true)
                .allowedHeaders("*")
                .maxAge(3600);
    }

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
//        File file=new File("/home/graduationProject/fourINone/O04/FileUpload/");
        File file=new File("/Users/joji/Desktop/running/upload");
        if (!file.exists()){
            file.mkdirs();//创建该文件夹
            try {
                LoggerFactory.getLogger(getClass()).info("图片库文件夹不存在创建该文件夹，路径："+file.getCanonicalPath());
            } catch (IOException ex) {
                ex.printStackTrace();
            }
        }

        registry.addResourceHandler("/app/**").addResourceLocations("file:/Users/joji/Desktop/running/running_app/dist/");
        registry.addResourceHandler("/file/**").addResourceLocations("file:"+file.getPath()+"/");
        registry.addResourceHandler("/**").addResourceLocations("classpath:/static/");
    }
}
