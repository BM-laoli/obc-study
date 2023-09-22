//
//  BNRItemViewController.m
//  Homepwner
//
//  Created by 李仕增 on 2023/9/20.
//

#import "BNRItemViewController.h"
#import "BNRItemStore.h"
#import "BNRItem.h"
#import "BNRDetailViewController.h"

@interface BNRItemViewController()
@property (nonatomic,strong) IBOutlet UIView *headerView;
@end


@implementation BNRItemViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self.tableView registerClass:[UITableViewCell class]
           forCellReuseIdentifier:@"UITableViewCell"];
    
    UIView *header = self.headerView;
    [self.tableView setTableHeaderView:header];
}

- (instancetype)initWithStyle:(UITableViewStyle)style
{
    return [self init];
}

- (instancetype)init
{
    self = [super initWithStyle:UITableViewStylePlain];
    if (self) {
        UINavigationItem *navItem = self.navigationItem;
        navItem.title = @"Homepwner";
        
        // 创建两个按钮
        UIBarButtonItem *bbi = [[UIBarButtonItem alloc]
                                initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                target:self
                                action:@selector(addNewItem:)];
        navItem.rightBarButtonItem = bbi;
        navItem.leftBarButtonItem = self.editButtonItem;
    }
    return self;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[[BNRItemStore sharedStore] allItems] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Get a new or recycled cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];

    // Set the text on the cell with the description of the item
    // that is at the nth index of items, where n = row this cell
    // will appear in on the tableview
    NSArray *items = [[BNRItemStore sharedStore] allItems];
    BNRItem *item = items[indexPath.row];

    cell.textLabel.text = [item description];

    return cell;
}

//- (UIView *)headerView
//{
//    if(!_headerView) {
//        [[NSBundle mainBundle]loadNibNamed:@"HeaderView" owner:self options:nil];
//    }
//    return _headerView;
//}

- (IBAction)addNewItem:(id)sender
{
    // 这里不仅仅要处理View 上的dataSource Delegate 还有处理 Mode(BNRItemStore)
    // createItem 这里会自动的给Model里加一项
    BNRItem *newItem = [[BNRItemStore sharedStore]createItem];
    
    // 获取最后一项 item的索引
    NSInteger lasRow = [[[BNRItemStore sharedStore] allItems]indexOfObject:newItem];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:lasRow inSection:0];
    
    // 重写设置回去
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationTop];
    
}

- (IBAction)toggleEditingModel:(id)sender
{
 if(self.isEditing)
 {
     [sender setTitle:@"Edit" forState:UIControlStateNormal];
     
     [self setEditing:NO animated:YES];
 }else {
     [sender setTitle:@"Done" forState:UIControlStateNormal];
     
     [self setEditing:YES animated:YES];
 }
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    // dataSoucre delegate 上 delete 的callback
    if(editingStyle == UITableViewCellEditingStyleDelete)
    {
        NSArray *items = [[BNRItemStore sharedStore]allItems];
        BNRItem *item = items[indexPath.row];
        [[BNRItemStore sharedStore]removeItem:item];
        
        // 删除表格中的动画
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    [[BNRItemStore sharedStore] moveItemAtIdex:sourceIndexPath.row toIndex:destinationIndexPath.row];
}

// 点击的时候去进行一个导航
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    BNRDetailViewController *detailVC = [[BNRDetailViewController alloc]init];
    NSArray *items = [[BNRItemStore sharedStore]allItems];
    BNRItem *item = items[indexPath.row];
    detailVC.item = item;
    
    [self.navigationController pushViewController:detailVC animated:YES];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear: animated];
    [self.tableView reloadData];
}
@end
