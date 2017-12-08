//
//  HoneyQDViewController.m
//  HoneyQD
//
//  Created by chenlinios@sina.com on 12/04/2017.
//  Copyright (c) 2017 chenlinios@sina.com. All rights reserved.
//

#import "HoneyQDViewController.h"
#import "HoneyQD.h"



@interface HoneyQDViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation HoneyQDViewController
{
    NSInteger  cacheCount;
    UITableView *table;
}

- (void)viewDidLoad
{
    
    NSString *documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES)lastObject];
    
    
 

    HoneyQDLog(@"路径 %@",[CleanCache documentPath]);

    [CleanCache clearCachesFromDirectoryPath:documentPath];
    
    
    table = [[UITableView alloc] initWithFrame:CGRectMake(0, 0,  self.view.width, self.view.height) style:UITableViewStylePlain];
    table.delegate = self;
    table.dataSource = self;
    [table registerClass:[UITableViewCell class] forCellReuseIdentifier:@"CCCCC"];
    [self.view addSubview:table];
 
/*
    [NetworkTool NetworkToolWithMethod:HTTPMethodGET url:@"http://172.20.10.2/cache.php" params:nil success:^(NSDictionary *jsonDic) {
        cacheCount = jsonDic.count;
        [table reloadData];
    } fail:^(id cc) {
        
    }];
  */
  
    [super viewDidLoad];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return cacheCount;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [table dequeueReusableCellWithIdentifier:@"CCCCC"];
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row +1];
    return  cell;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
