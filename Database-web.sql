


USE WEB_PM
CREATE TABLE web_user (
  id int NOT NULL  identity(1,1) ,
  name varchar(50)  NOT NULL,
  email varchar(50)  NOT NULL,
  phone varchar(15)  NOT NULL,
  address varchar(128)  NOT NULL,
  password varchar(40) NOT NULL,
  created int NOT NULL,
  PRIMARY KEY (id)
)  ;
GO

CREATE TABLE catalog(
  id int NOT NULL identity(1,1),
  name varchar(128)   NOT NULL,
  sort_order tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (id)
);
GO

CREATE TABLE product (
  id int NOT NULL identity(1,1),
  catalog_id int NOT NULL,
  name varchar(100)  NOT NULL,
  price decimal(15,4) NOT NULL DEFAULT '0.0000',
  content text  NOT NULL,
  discount int NOT NULL,
  image_link varchar(50)  NOT NULL,
  image_list text  NOT NULL,
  created int NOT NULL DEFAULT '0',
  viewed int NOT NULL DEFAULT '0',
  rating int default '0',
  PRIMARY KEY (id),
  FOREIGN KEY (catalog_id) REFERENCES catalog(id)
)  ;
GO


CREATE TABLE transactions (
  id bigint NOT NULL identity(1,1),
  status tinyint NOT NULL DEFAULT '0',
  user_id int NOT NULL DEFAULT '0',
  user_name varchar(50)  NOT NULL,
  user_email varchar(50)  NOT NULL,
  user_phone varchar(20)  NOT NULL,
  amount decimal(15,4) NOT NULL DEFAULT '0.0000',
  payment varchar(32)  NOT NULL,
  payment_info text  NOT NULL,
  message varchar(255)  NOT NULL,
  security varchar(16)  NOT NULL,
  created int NOT NULL DEFAULT '0',
  PRIMARY KEY (id),
  FOREIGN KEY (user_id) REFERENCES web_user(id)
)  ;
GO

CREATE TABLE orders (
  transaction_id bigint NOT NULL,
  id int NOT NULL identity(1,1),
  product_id int NOT NULL,
  qty int NOT NULL DEFAULT '0',
  amount decimal(15,4) NOT NULL DEFAULT '0.0000',
  data text  NOT NULL,
  status tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (id),
  FOREIGN KEY (transaction_id) REFERENCES transactions(id)
)  ;
GO

INSERT INTO web_user VALUES ('1','Bach','bach050296@yahoo.com.vn','01285688645','TPHCM','123','1')
INSERT INTO web_user VALUES ('2','Hoang','hoang123@yahoo.com.vn','01258314568','TPHCM','123','1')
GO

INSERT INTO catalog VALUES ('1','Sony','0')
INSERT INTO catalog VALUES ('2','ASUS','0')
INSERT INTO catalog VALUES ('3','HTC','0')
INSERT INTO catalog VALUES ('4','Xiaomi','0')
INSERT INTO catalog VALUES ('5','Iphone','0')
INSERT INTO catalog VALUES ('6','Samsung','0')
INSERT INTO catalog VALUES ('7','OPPO','0')
GO 

INSERT INTO product VALUES ('IP203','1','Sony Xperia X','5500000 ','Sony vừa giới thiệu dòng sản phẩm X Serie mới của hãng trong năm 2016 tại triển lãm MWC. Xperia X là chiếc smartphone tầm trung mới với nhiều điểm nhấn đáng chú ý.','0','1')
INSERT INTO product VALUES ('IP001','5','Iphone 7 32GB','21000000 ','Với thiết kế không quá nhiều thay đổi, vẫn bảo tồn vẻ đẹp truyền thống từ thời iPhone 6 Plus,  iPhone 7 Plus 32GB được trang bị nhiều nâng cấp đáng giá như camera kép, đạt chuẩn chống nước chống bụi cùng cấu hình cực mạnh.','0','1')
INSERT INTO product VALUES ('IP002','5','Iphone 7 128GB','21000000 ','Với thiết kế không quá nhiều thay đổi, vẫn bảo tồn vẻ đẹp truyền thống từ thời iPhone 6 Plus,  iPhone 7 Plus 32GB được trang bị nhiều nâng cấp đáng giá như camera kép, đạt chuẩn chống nước chống bụi cùng cấu hình cực mạnh.','0','1')
INSERT INTO product VALUES ('IP003','5','Iphone 7 256GB','21000000 ','Với thiết kế không quá nhiều thay đổi, vẫn bảo tồn vẻ đẹp truyền thống từ thời iPhone 6 Plus,  iPhone 7 Plus 32GB được trang bị nhiều nâng cấp đáng giá như camera kép, đạt chuẩn chống nước chống bụi cùng cấu hình cực mạnh.','0','1')
INSERT INTO product VALUES ('IP001s','5','Iphone 7 plus 32GB','22000000 ','Với thiết kế không quá nhiều thay đổi, vẫn bảo tồn vẻ đẹp truyền thống từ thời iPhone 6 Plus,  iPhone 7 Plus 32GB được trang bị nhiều nâng cấp đáng giá như camera kép, đạt chuẩn chống nước chống bụi cùng cấu hình cực mạnh.','0','1')
INSERT INTO product VALUES ('IP002s','5','Iphone 7 plus 128GB','22000000 ','Với thiết kế không quá nhiều thay đổi, vẫn bảo tồn vẻ đẹp truyền thống từ thời iPhone 6 Plus,  iPhone 7 Plus 32GB được trang bị nhiều nâng cấp đáng giá như camera kép, đạt chuẩn chống nước chống bụi cùng cấu hình cực mạnh.','0','1')
INSERT INTO product VALUES ('IP003s','5','Iphone 7 plus 256GB','22000000 ','Với thiết kế không quá nhiều thay đổi, vẫn bảo tồn vẻ đẹp truyền thống từ thời iPhone 6 Plus,  iPhone 7 Plus 32GB được trang bị nhiều nâng cấp đáng giá như camera kép, đạt chuẩn chống nước chống bụi cùng cấu hình cực mạnh.','0','1')
INSERT INTO product VALUES ('IP100','6','Samsung Galaxy S8','18490000','Galaxy S8 là siêu phẩm mới nhất được Samsung ra mắt vào ngày 29/3 với thiết kế nhỏ gọn hoàn toàn mới, màn hình vô cực viền siêu mỏng.','0','1')
INSERT INTO product VALUES ('IP100s','6','Samsung Galaxy S8 plus','20490000 ','Galaxy S8 và S8 Plus hiện đang là chuẩn mực smartphone về thiết kế trong tương lai. Sau nhiều ngày được sử dụng, mình xin chia sẻ những cảm nhận chi tiết nhất về chiếc Galaxy S8 Plus - thiết bị đang có doanh số đặt hàng khủng nhất hiện tại.','0','1')
INSERT INTO product VALUES ('IP200','1','Sony Xperia XZ Premium','18490000','Sony Xperia XZ Premium là flagship của Sony trong năm 2017 với vẻ ngoài hào nhoáng, màn hình cao cấp cũng nhiều trang bị hàng đầu khác.','0','1')
INSERT INTO product VALUES ('IP300','3','HTC U11','16990000 ','HTC U11 là smartphone cao cấp nhất của HTC trong năm 2017 với nhiều nâng cấp tập trung vào trải nghiệm người dùng thú vị so với model tiền nhiệm.','0','1')
INSERT INTO product VALUES ('IP 400','4','Xiaomi Mi MIX (6GB/256GB)','13990000 ','Kể từ khi Mi Mix được giới thiệu thì mình rất háo hức được cầm trên tay một chiếc điện thoại như vậy, một trải nghiệm từ hai năm trước khi mình cầm Sharp Aquos Crystal. Cầm trên tay, thậm chí khi chưa bật màn hình lên thì Mi Mix cho mình nhiều cảm xúc hơn bất kỳ chiếc Xiaomi nào từ trước tới giờ. Cảm giác đó khó tả, nó là vật liệu gốm, là một chiếc máy đẹp, chắc chắn, là màn hình không viền...','0','1')
INSERT INTO product VALUES ('IP500','6','Samsung Galaxy Note 5','10990000 ','Tiếp theo thành công vang dội của Galaxy Note 4 thì Galaxy Note 5 càng trở nên hoàn thiện và mạnh mẽ hơn.','0','1')
INSERT INTO product VALUES ('IP600','6','Samsung Galaxy S7 Edge','15490000','Samsung Galaxy S7 Edge Xanh Coral được kết hợp giữa 2 màu sắc xanh dương và vàng tạo nên một tổng thể thiết kế vô cùng sang trọng và bắt mắt.','0','1')
INSERT INTO product VALUES ('IP700','5','Iphone 6 plus','11990000','Được đổi mới mạnh mẽ về thiết kế, cấu hình cùng một màn hình kích thước lớn đi cùng mang đến nhiều thích thú hơn trong sử dụng.','0','1')
INSERT INTO product VALUES ('IP800','7','OPPO F1s ','6990000','Tiếp nối sự thành công rực rỡ từ người tiền nhiệm OPPO F1s thì mới đây OPPO đã chính thức giới thiệu phiên bản kế nhiệm với nâng cấp nhẹ về cầu hình mang tên OPPO F1s 2017.','0','1')
INSERT INTO product VALUES ('IP900','7','OPPO F3','6990000','Cuối cùng thì mẫu "chuyên gia selfie" mới OPPO F3 cũng đã chính thức được trình làng với cụm camera trước kép trang bị nhiều tính năng selfie tuyệt vời hứa hẹn sẽ đem đến trải nghiệm đáng giá cho người dùng.','0','1')
INSERT INTO product VALUES ('IP202','1','Sony Xperia XA Ultra','6990000 ','Sony Xperia XA Ultra sở hữu màn hình lớn cùng camera trước có độ phân giải cao cùng nhiều tính năng cao cấp.','0','1')
INSERT INTO product VALUES ('IP204','1','Sony Xperia XA1','6490000','Xperia XA1 là bản nâng cấp của chiếc Xperia XA đã khá thành công ở thị trường nước ta, với thiết kế khá tương đồng siêu phẩm Xperia XZ, cấu hình được trang bị cao hơn và camera có chất lượng tốt hơn.','0','1')
INSERT INTO product VALUES ('IP205','2','Asus Zenfone 3 ZE520KL','6990000','Zenfone 3 ZE520KL sở hữu thiết kế đẹp, cấu hình khá cùng nhiều nâng cấp đáng giá so với thế hệ Zenfone 2 năm ngoái.','0','1')
INSERT INTO product VALUES ('IP206','3','HTC 10 evo','5990000 ','HTC 10 evo mang lại cho bạn trải nghiệm về thiết kế, những trang bị cao cấp của một chiếc flagship đến từ HTC nhưng với mức giá chưa tới một nửa.','0','1')
INSERT INTO product VALUES ('IP207','3','HTC One A9s','5500000 ','Mẫu smartphone tầm trung mới nhất của HTC là One A9s vừa được nhà sản xuất Đài Loan ra mắt tại triển lãm IFA 2016 với nhiều điểm nâng cấp mạnh mẽ.','0','1')
INSERT INTO product VALUES ('IP208','2','Asus Zenfone 3 Max 5.5" ','5500000 ','Asus ZenFone 3 Max (ZC553KL) là một phiên bản biến thể khác của Zenfone 3 Max đã ra đời trước đó, với nhiều điểm cải tiến điển hình là camera 16 MP, hỗ trợ lấy nét laser, dùng bộ xử lý của Qualcomm và màn hình 5.5 inch.','0','1')
INSERT INTO product VALUES ('IP209','2','Asus Zenfone 3 Max','4190000 ','Tiếp nối sự thành công của chiếc Zenfone Max ra đời năm ngoái thì Asus tiếp tục giới thiệu thêm phiên bản kế nhiệm là chiếc Zenfone 3 Max với nhiều thay đổi về ngoài hình cũng như tính năng.','0','1')
INSERT INTO product VALUES ('IP210','3','HTC One E9 Dual','4490000','One E9 Dual mang thiết kế khá quen thuộc từ nhà sản xuất HTC, cấu hình mạnh mẽ, màn hình lớn Full HD kết hợp cùng hệ thống loa Boomsound đặc trưng.','0','1')
GO

INSERT INTO transactions VALUES ('1','1','1','Bach','bach050296@yahoo.com.vn','01285688645','TPHCM','123','1')
INSERT INTO transactions VALUES ('1','1','1','Bach','bach050296@yahoo.com.vn','01285688645','TPHCM','123','1')
