#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad
{
  [super viewDidLoad];

  NSString *HTMLString = @"<p>Hello, <strong>World</strong>.";
  NSData *HTMLData = [HTMLString dataUsingEncoding:NSUTF8StringEncoding];

  NSError *attributedStringError = nil;
  NSDictionary *documentAttributes = @{ NSDefaultAttributesDocumentAttribute : @{ NSFontAttributeName : [UIFont fontWithName:@"MarkerFelt-Wide" size:30], NSForegroundColorAttributeName : [UIColor redColor] } };
  NSAttributedString *attributedString = [[NSAttributedString alloc] initWithData:HTMLData options:@{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType } documentAttributes:&documentAttributes error:&attributedStringError];
  if (attributedString == nil) NSLog(@"%@", attributedStringError);

  self.label.attributedText = attributedString;
}

@end
