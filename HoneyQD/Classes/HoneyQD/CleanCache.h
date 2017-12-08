//
//  CleanCache.h
//  Expecta
//
//  Created by 陈林 on 2017/12/8.
//

#import <Foundation/Foundation.h>

@interface CleanCache : NSObject


/**
 获取 Documents 目录

 @return Documents 目录
 */
+(NSString *)documentPath;


/**
 获取 Library 目录

 @return Library 目录
 */
+(NSString *)libraryPath;


/**
 获取 tmp 目录
 
 @return tmp 目录
 */
+(NSString *)tmpPath;


/**
 根据路径返回目录或文件的大小(单位 ：B)

 @param path 目录或文件的路径
 @return 文件大小
 */
+(NSInteger)sizeWithFilePath:(NSString *)path;

/**
 根据路径返回目录或文件的大小(已转换B、KB、MB、GB单位)

 @param path <#path description#>
 @return <#return value description#>
 */
+(NSString *)sizeStrWithFilePath:(NSString *)path;

/**
 获取路径下所有文件的名字

 @param dirPath 路径
 @return 文件名字目录
 */
+ (NSArray *)getAllFileNames:(NSString *)dirPath;



/**
 删除目录下所有文件

 @param dirPath 目录
 @return 操作结果(BOOL)
 */
+ (BOOL)clearCachesFromDirectoryPath:(NSString *)dirPath;

@end
