//
//  NetworkTool.m
//  Expecta
//
//  Created by 陈林 on 2017/12/5.
//

#import "NetworkTool.h"

@implementation NetworkTool

+(void)NetworkToolWithMethod:(HTTPMethod)method url:(NSString *)url params:(NSDictionary *)params success:(void(^)(NSDictionary *jsonDic))success fail:(void(^)(id))fail {
  //处理请求网址
 
    switch (method) {
        case HTTPMethodGET:
        {    //GET方法
            if (params && [params count] > 0 && params != nil) {
                url = [NSString stringWithFormat:@"%@?%@",url,[NetworkTool dealWithParam:params]];
            }
            
 
            NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
            NSURLSession *session = [NSURLSession sharedSession];
            NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
                    if (dic) {
 
                        
                        
                        
                        success(dic);
                    } else {
                        fail(error.description);
                    }
                });
            }];
            [task resume];
         }
            break;
     case HTTPMethodPOST:
         {
              NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
             [request setHTTPMethod:@"POST"];
             NSString *body = [self dealWithParam:params];
             NSData *bodyData =  [body dataUsingEncoding:NSUTF8StringEncoding];
             
             //设置请求实体
             [request setHTTPBody:bodyData];
             //设置本次请求提交数据的格式
             [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
         
             // 设置本次请求请求体的长度(因为服务器会根据你这个设定的长度去解析你的请求体中的参数内容)
             [request setValue:[NSString stringWithFormat:@"%lu",bodyData.length] forHTTPHeaderField:@"Content-Length"];
             
             //设置本次请求的最大时常
             request.timeoutInterval = 20;
             NSURLSession *session = [NSURLSession sharedSession];
             
             NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                 dispatch_async(dispatch_get_main_queue(), ^{
                     NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
                     if (dic) {
                         success(dic);
                     } else {
                         fail(error.description);
                     }
                 });
                 
             }];
             [task resume];
         }
            
            break;
            
        default:
            NSLog(@"请求方法未知");
      break;
    }
  
    
}

// 处理字典参数
+ (NSString *)dealWithParam:(NSDictionary *)param
{
    NSArray *allkeys = [param allKeys];
    
    NSMutableString *result = [NSMutableString string];
    
    for (NSString *key in allkeys) {
        
        NSString *str = [NSString stringWithFormat:@"%@=%@&",key,param[key]];
        
        [result appendString:str];
    }
    
    return [result substringWithRange:NSMakeRange(0, result.length-1)];
    
}



@end
