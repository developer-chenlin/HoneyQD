//
//  NetworkTool.h
//  Expecta
//
//  Created by 陈林 on 2017/12/5.
//


#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, HTTPMethod) {
    HTTPMethodGET,   //GET请求
    HTTPMethodPOST   //POST请求
};

@interface NetworkTool : NSObject

+(void)NetworkToolWithMethod:(HTTPMethod)method url:(NSString *)url params:(NSDictionary *)params success:(void(^)(NSDictionary *jsonDic))success fail:(void(^)(id))fail;

@end
