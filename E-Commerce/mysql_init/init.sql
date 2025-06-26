-- mysql_init/init.sql
CREATE DATABASE IF NOT EXISTS ecommerce_daily;
USE ecommerce_daily;

CREATE TABLE IF NOT EXISTS customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	email VARCHAR(50),
	phone_number VARCHAR(50),
	city VARCHAR(50),
	postal_code VARCHAR(50),
	country VARCHAR(50),
	date_of_birth DATE,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
	product_name VARCHAR(50),
	category VARCHAR(50),
	price DECIMAL(6,2),
	description TEXT,
	stock_quantity INT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS orders (
	order_id INT AUTO_INCREMENT PRIMARY KEY,
	customer_id INT,
	product_id INT,
	quantity INT,
	order_date DATE,
	total_amount DECIMAL(10,2),
	order_status VARCHAR(20),
	FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
	FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Mock data
insert into customers (first_name, last_name, email, phone_number, city, postal_code, country, date_of_birth) values ('Flinn', 'Claybourn', 'fclaybourn0@youku.com', '477-757-2283', 'Budzów', '34-211', 'Poland', '1954-04-03');
insert into customers (first_name, last_name, email, phone_number, city, postal_code, country, date_of_birth) values ('Bink', 'Deavin', 'bdeavin1@hugedomains.com', '685-596-9800', 'Catarman', '9104', 'Philippines', '1921-09-02');
insert into customers (first_name, last_name, email, phone_number, city, postal_code, country, date_of_birth) values ('Jessie', 'Tod', 'jtod2@paypal.com', '267-505-2041', 'La Victoria', '155007', 'Colombia', '1986-02-04');
insert into customers (first_name, last_name, email, phone_number, city, postal_code, country, date_of_birth) values ('Layney', 'Wardington', 'lwardington3@businessweek.com', '401-181-7085', 'Klos', null, 'Albania', '1916-08-07');
insert into customers (first_name, last_name, email, phone_number, city, postal_code, country, date_of_birth) values ('Taylor', 'Straughan', 'tstraughan4@google.nl', '445-844-0761', 'Benito Juarez', '96720', 'Mexico', '1925-03-02');
insert into customers (first_name, last_name, email, phone_number, city, postal_code, country, date_of_birth) values ('Ham', 'Sorton', 'hsorton5@webnode.com', '724-235-0129', 'Heihe', null, 'China', '1923-12-01');
insert into customers (first_name, last_name, email, phone_number, city, postal_code, country, date_of_birth) values ('Lethia', 'Chattell', 'lchattell6@cafepress.com', '268-572-9383', 'Masaya', null, 'Nicaragua', '1901-12-05');
insert into customers (first_name, last_name, email, phone_number, city, postal_code, country, date_of_birth) values ('Chevalier', 'Callard', 'ccallard7@de.vu', '877-620-7230', 'Baume-les-Dames', '25117 CEDEX', 'France', '1958-10-23');
insert into customers (first_name, last_name, email, phone_number, city, postal_code, country, date_of_birth) values ('Jandy', 'Mulrenan', 'jmulrenan8@marriott.com', '160-776-3564', 'Doropeti', null, 'Indonesia', '1945-06-25');
insert into customers (first_name, last_name, email, phone_number, city, postal_code, country, date_of_birth) values ('Dorry', 'Lambal', 'dlambal9@rakuten.co.jp', '148-532-7756', 'Lagoa do Itaenga', '55840-000', 'Brazil', '1996-03-17');
insert into customers (first_name, last_name, email, phone_number, city, postal_code, country, date_of_birth) values ('Halie', 'Coils', 'hcoilsa@cbslocal.com', '767-699-1039', 'Ipil', '7001', 'Philippines', '1983-11-01');
insert into customers (first_name, last_name, email, phone_number, city, postal_code, country, date_of_birth) values ('Sibylla', 'Swaisland', 'sswaislandb@nbcnews.com', '193-159-7669', 'Novomoskovsk', '301767', 'Russia', '1966-12-29');
insert into customers (first_name, last_name, email, phone_number, city, postal_code, country, date_of_birth) values ('Patrice', 'Spreckley', 'pspreckleyc@wordpress.org', '700-334-0128', 'Sumbersarikrajan', null, 'Indonesia', '1969-06-20');
insert into customers (first_name, last_name, email, phone_number, city, postal_code, country, date_of_birth) values ('Forbes', 'Renoden', 'frenodend@1und1.de', '687-779-6840', 'Youzai', null, 'China', '1960-02-13');
insert into customers (first_name, last_name, email, phone_number, city, postal_code, country, date_of_birth) values ('Ethelred', 'Vuitton', 'evuittone@networkadvertising.org', '547-285-9752', 'Rainis', null, 'Indonesia', '1953-03-17');
insert into customers (first_name, last_name, email, phone_number, city, postal_code, country, date_of_birth) values ('Maury', 'Bugby', 'mbugbyf@twitpic.com', '292-566-3784', 'Joyabaj', '14012', 'Guatemala', '1991-12-07');
insert into customers (first_name, last_name, email, phone_number, city, postal_code, country, date_of_birth) values ('Thedrick', 'Dever', 'tdeverg@weibo.com', '770-578-0901', 'Jeffrey’s Bay', '6332', 'South Africa', '1961-06-01');
insert into customers (first_name, last_name, email, phone_number, city, postal_code, country, date_of_birth) values ('Vincenz', 'Wollers', 'vwollersh@spotify.com', '439-710-6781', 'Ar Rawḑah', null, 'Syria', '1934-04-18');
insert into customers (first_name, last_name, email, phone_number, city, postal_code, country, date_of_birth) values ('Gabriela', 'Marler', 'gmarleri@usatoday.com', '560-610-7039', 'Vityazevo', '353421', 'Russia', '1987-02-02');
insert into customers (first_name, last_name, email, phone_number, city, postal_code, country, date_of_birth) values ('Teri', 'Acey', 'taceyj@amazon.co.uk', '731-184-5628', 'Lumbardhi', null, 'Kosovo', '1926-06-01');
insert into customers (first_name, last_name, email, phone_number, city, postal_code, country, date_of_birth) values ('Clara', 'Allabarton', 'callabartonk@soundcloud.com', '893-579-6546', 'Środa Wielkopolska', '63-001', 'Poland', '1935-03-12');
insert into customers (first_name, last_name, email, phone_number, city, postal_code, country, date_of_birth) values ('Fleurette', 'Schwander', 'fschwanderl@loc.gov', '608-539-7287', 'Sadovo', '4126', 'Bulgaria', '1940-09-29');
insert into customers (first_name, last_name, email, phone_number, city, postal_code, country, date_of_birth) values ('Roscoe', 'Bienvenu', 'rbienvenum@china.com.cn', '680-357-4484', 'Vyselki', '403029', 'Russia', '1941-08-09');
insert into customers (first_name, last_name, email, phone_number, city, postal_code, country, date_of_birth) values ('Demetre', 'Plover', 'dplovern@washington.edu', '161-802-3622', 'Baykit', '648360', 'Russia', '1987-04-27');
insert into customers (first_name, last_name, email, phone_number, city, postal_code, country, date_of_birth) values ('Diahann', 'Jann', 'djanno@amazonaws.com', '507-436-6558', 'Zengtian', null, 'China', '1959-02-22');
insert into customers (first_name, last_name, email, phone_number, city, postal_code, country, date_of_birth) values ('Hector', 'Andrysiak', 'handrysiakp@symantec.com', '233-805-3689', 'Sopo', null, 'Indonesia', '1996-11-09');
insert into customers (first_name, last_name, email, phone_number, city, postal_code, country, date_of_birth) values ('Jareb', 'MacCook', 'jmaccookq@buzzfeed.com', '214-730-8402', 'Jielin', null, 'China', '1955-11-08');
insert into customers (first_name, last_name, email, phone_number, city, postal_code, country, date_of_birth) values ('Shay', 'Gogan', 'sgoganr@bigcartel.com', '184-909-9040', 'Hilversum', '1209', 'Netherlands', '1925-02-17');
insert into customers (first_name, last_name, email, phone_number, city, postal_code, country, date_of_birth) values ('Grantley', 'Thow', 'gthows@marriott.com', '155-580-3997', 'Chimtāl', null, 'Afghanistan', '1970-05-20');
insert into customers (first_name, last_name, email, phone_number, city, postal_code, country, date_of_birth) values ('Goddart', 'Odo', 'godot@gizmodo.com', '609-284-1873', 'Budayuan', null, 'China', '1928-02-11');
insert into customers (first_name, last_name, email, phone_number, city, postal_code, country, date_of_birth) values ('Lyon', 'Penquet', 'lpenquetu@oracle.com', '424-937-5668', 'Coasa', null, 'Peru', '1907-07-03');
insert into customers (first_name, last_name, email, phone_number, city, postal_code, country, date_of_birth) values ('Violetta', 'Rogers', 'vrogersv@wordpress.com', '216-925-0687', 'Al Wardānīn', null, 'Tunisia', '1991-10-19');
insert into customers (first_name, last_name, email, phone_number, city, postal_code, country, date_of_birth) values ('Abbi', 'Petrelli', 'apetrelliw@photobucket.com', '694-189-0849', 'Kelmė', '86001', 'Lithuania', '1932-07-14');
insert into customers (first_name, last_name, email, phone_number, city, postal_code, country, date_of_birth) values ('Fiorenze', 'Kinnier', 'fkinnierx@tamu.edu', '788-112-2198', 'Wasilków', '16-010', 'Poland', '1907-10-07');
insert into customers (first_name, last_name, email, phone_number, city, postal_code, country, date_of_birth) values ('Gavra', 'Alban', 'galbany@tripod.com', '141-474-7996', 'Caucaia', '61600-000', 'Brazil', '1942-08-11');
insert into customers (first_name, last_name, email, phone_number, city, postal_code, country, date_of_birth) values ('Windham', 'Kinghorne', 'wkinghornez@a8.net', '152-816-1359', 'Dauriya', '674660', 'Russia', '1949-02-05');
insert into customers (first_name, last_name, email, phone_number, city, postal_code, country, date_of_birth) values ('Corilla', 'Bantock', 'cbantock10@bluehost.com', '524-827-1250', 'Kafr Takhārīm', null, 'Syria', '1984-10-24');
insert into customers (first_name, last_name, email, phone_number, city, postal_code, country, date_of_birth) values ('Giselbert', 'Cacacie', 'gcacacie11@facebook.com', '308-295-2133', 'Trpinja', '32224', 'Croatia', '1997-09-21');
insert into customers (first_name, last_name, email, phone_number, city, postal_code, country, date_of_birth) values ('Laraine', 'Frazer', 'lfrazer12@skype.com', '912-215-5481', 'Fangjun', null, 'China', '1914-11-20');
insert into customers (first_name, last_name, email, phone_number, city, postal_code, country, date_of_birth) values ('Fanchette', 'Blacker', 'fblacker13@auda.org.au', '814-712-8140', 'Zibo', null, 'China', '1972-05-16');
insert into customers (first_name, last_name, email, phone_number, city, postal_code, country, date_of_birth) values ('Cherise', 'McArtan', 'cmcartan14@un.org', '621-628-3155', 'Tsagaanders', null, 'Mongolia', '1907-12-21');
insert into customers (first_name, last_name, email, phone_number, city, postal_code, country, date_of_birth) values ('Kelsy', 'Maymond', 'kmaymond15@addtoany.com', '898-692-8723', 'Zhize', null, 'China', '1939-09-28');
insert into customers (first_name, last_name, email, phone_number, city, postal_code, country, date_of_birth) values ('Garrek', 'Curr', 'gcurr16@thetimes.co.uk', '998-172-4823', 'Kusi', null, 'Indonesia', '1978-05-14');
insert into customers (first_name, last_name, email, phone_number, city, postal_code, country, date_of_birth) values ('Cesar', 'Shropsheir', 'cshropsheir17@php.net', '633-432-4505', 'Lokot’', '242315', 'Russia', '1984-05-30');
insert into customers (first_name, last_name, email, phone_number, city, postal_code, country, date_of_birth) values ('Ermin', 'Reddlesden', 'ereddlesden18@oracle.com', '462-436-9798', 'Qionghai', null, 'China', '1947-01-03');
insert into customers (first_name, last_name, email, phone_number, city, postal_code, country, date_of_birth) values ('Thain', 'Feyer', 'tfeyer19@ycombinator.com', '928-705-8959', 'Tilburg', '5044', 'Netherlands', '1922-03-23');
insert into customers (first_name, last_name, email, phone_number, city, postal_code, country, date_of_birth) values ('Doretta', 'Bennen', 'dbennen1a@indiegogo.com', '202-570-1676', 'Washington', '20520', 'United States', '1965-05-02');
insert into customers (first_name, last_name, email, phone_number, city, postal_code, country, date_of_birth) values ('Richmond', 'Pane', 'rpane1b@webeden.co.uk', '113-834-2163', 'Sakai', '999-2256', 'Japan', '1994-04-18');
insert into customers (first_name, last_name, email, phone_number, city, postal_code, country, date_of_birth) values ('Linn', 'Blasl', 'lblasl1c@creativecommons.org', '738-836-7758', 'Paprotnia', '08-107', 'Poland', '1988-02-13');
insert into customers (first_name, last_name, email, phone_number, city, postal_code, country, date_of_birth) values ('Pamella', 'Maharg', 'pmaharg1d@bloomberg.com', '378-213-4074', 'Tabūk', null, 'Saudi Arabia', '1902-05-19');
insert into customers (first_name, last_name, email, phone_number, city, postal_code, country, date_of_birth) values ('Henri', 'Cubbinelli', 'hcubbinelli1e@ehow.com', '993-100-2686', 'Jaffna', '40000', 'Sri Lanka', '1972-05-20');
insert into customers (first_name, last_name, email, phone_number, city, postal_code, country, date_of_birth) values ('Rickert', 'Hasell', 'rhasell1f@ebay.co.uk', '749-897-8495', 'Vukovar', '32010', 'Croatia', '1918-02-10');
insert into customers (first_name, last_name, email, phone_number, city, postal_code, country, date_of_birth) values ('Lorilyn', 'Kliche', 'lkliche1g@slideshare.net', '910-757-9992', 'Kronoby', '01760', 'Finland', '1998-07-19');
insert into customers (first_name, last_name, email, phone_number, city, postal_code, country, date_of_birth) values ('Freemon', 'Minigo', 'fminigo1h@icio.us', '906-806-8681', 'Shishan', null, 'China', '1948-02-22');
insert into customers (first_name, last_name, email, phone_number, city, postal_code, country, date_of_birth) values ('Joelly', 'Fernyhough', 'jfernyhough1i@123-reg.co.uk', '293-729-7381', 'Krynice', '22-610', 'Poland', '1901-07-01');
insert into customers (first_name, last_name, email, phone_number, city, postal_code, country, date_of_birth) values ('Francois', 'Budnk', 'fbudnk1j@goo.gl', '134-614-4048', 'Noebana', null, 'Indonesia', '1984-12-24');
insert into customers (first_name, last_name, email, phone_number, city, postal_code, country, date_of_birth) values ('Brett', 'Krelle', 'bkrelle1k@reference.com', '473-357-4240', 'Goubangzi', null, 'China', '1905-06-02');
insert into customers (first_name, last_name, email, phone_number, city, postal_code, country, date_of_birth) values ('Hendrik', 'Bleibaum', 'hbleibaum1l@smugmug.com', '237-242-6248', 'Runović', '21261', 'Croatia', '1958-02-11');
insert into customers (first_name, last_name, email, phone_number, city, postal_code, country, date_of_birth) values ('Dani', 'Philippou', 'dphilippou1m@soup.io', '475-897-7221', 'Kaputian', '8120', 'Philippines', '1983-07-04');
insert into customers (first_name, last_name, email, phone_number, city, postal_code, country, date_of_birth) values ('Agustin', 'Mattheeuw', 'amattheeuw1n@com.com', '625-175-3729', 'Villa Castelli', '5355', 'Argentina', '1943-03-25');
insert into customers (first_name, last_name, email, phone_number, city, postal_code, country, date_of_birth) values ('Agnes', 'Harmes', 'aharmes1o@liveinternet.ru', '369-262-5741', 'Aristóbulo del Valle', '3363', 'Argentina', '1996-10-24');
insert into customers (first_name, last_name, email, phone_number, city, postal_code, country, date_of_birth) values ('Robers', 'Haley', 'rhaley1p@china.com.cn', '887-871-7152', 'Dakingari', null, 'Nigeria', '1908-05-21');
insert into customers (first_name, last_name, email, phone_number, city, postal_code, country, date_of_birth) values ('Gayle', 'Morteo', 'gmorteo1q@instagram.com', '583-244-8038', 'Wysoka Strzyżowska', '38-123', 'Poland', '1956-10-01');
insert into customers (first_name, last_name, email, phone_number, city, postal_code, country, date_of_birth) values ('Anitra', 'Veldman', 'aveldman1r@clickbank.net', '124-997-0031', 'Namayingo', null, 'Uganda', '1936-05-01');
insert into customers (first_name, last_name, email, phone_number, city, postal_code, country, date_of_birth) values ('Town', 'Pomfret', 'tpomfret1s@etsy.com', '482-995-0996', 'Hanyin Chengguanzhen', null, 'China', '1964-02-19');
insert into customers (first_name, last_name, email, phone_number, city, postal_code, country, date_of_birth) values ('Duncan', 'Ouldcott', 'douldcott1t@ustream.tv', '815-316-7585', 'Vista Hermosa', '87078', 'Mexico', '1992-12-26');
insert into customers (first_name, last_name, email, phone_number, city, postal_code, country, date_of_birth) values ('Sybille', 'Smallthwaite', 'ssmallthwaite1u@taobao.com', '369-933-0712', 'Laholm', '312 36', 'Sweden', '1976-10-18');
insert into customers (first_name, last_name, email, phone_number, city, postal_code, country, date_of_birth) values ('Dominique', 'Davenhall', 'ddavenhall1v@ameblo.jp', '571-907-8646', 'Baimajing', null, 'China', '1930-05-01');
insert into customers (first_name, last_name, email, phone_number, city, postal_code, country, date_of_birth) values ('Ranee', 'Marciskewski', 'rmarciskewski1w@oracle.com', '510-878-1934', 'Titay', '7003', 'Philippines', '1927-12-01');
insert into customers (first_name, last_name, email, phone_number, city, postal_code, country, date_of_birth) values ('Georgi', 'Antuk', 'gantuk1x@github.com', '633-547-7705', 'Krynychky', null, 'Ukraine', '1947-12-11');
insert into customers (first_name, last_name, email, phone_number, city, postal_code, country, date_of_birth) values ('Arliene', 'Hayworth', 'ahayworth1y@hud.gov', '688-751-9028', 'Alejal', '9205', 'Philippines', '1997-11-12');
insert into customers (first_name, last_name, email, phone_number, city, postal_code, country, date_of_birth) values ('Analiese', 'Pantone', 'apantone1z@marketwatch.com', '730-857-6435', 'Pilar do Sul', '18185-000', 'Brazil', '1990-08-22');
insert into customers (first_name, last_name, email, phone_number, city, postal_code, country, date_of_birth) values ('Edita', 'Hills', 'ehills20@huffingtonpost.com', '822-114-6721', 'San Juan', null, 'Peru', '1930-07-28');
insert into customers (first_name, last_name, email, phone_number, city, postal_code, country, date_of_birth) values ('Chelsy', 'Jeenes', 'cjeenes21@gmpg.org', '292-596-0407', 'Valence', '26907 CEDEX 9', 'France', '1991-05-03');
insert into customers (first_name, last_name, email, phone_number, city, postal_code, country, date_of_birth) values ('Piggy', 'Jopke', 'pjopke22@amazonaws.com', '914-129-0366', 'Shuangshan', null, 'China', '1970-01-18');
insert into customers (first_name, last_name, email, phone_number, city, postal_code, country, date_of_birth) values ('Cash', 'Escritt', 'cescritt23@lulu.com', '798-734-8522', 'Xilaiqiao', null, 'China', '1902-09-15');
insert into customers (first_name, last_name, email, phone_number, city, postal_code, country, date_of_birth) values ('Marlo', 'Reddell', 'mreddell24@4shared.com', '847-861-0148', 'Östersund', '831 37', 'Sweden', '1919-07-18');
insert into customers (first_name, last_name, email, phone_number, city, postal_code, country, date_of_birth) values ('Ernaline', 'Sowerby', 'esowerby25@arstechnica.com', '344-659-6298', 'Jixiang', null, 'China', '1917-01-07');
insert into customers (first_name, last_name, email, phone_number, city, postal_code, country, date_of_birth) values ('Kristopher', 'Sacker', 'ksacker26@ca.gov', '517-713-1616', 'Tutong', null, 'Brunei', '1932-09-16');
insert into customers (first_name, last_name, email, phone_number, city, postal_code, country, date_of_birth) values ('Woodrow', 'Jimes', 'wjimes27@cloudflare.com', '409-866-4211', 'Ershilipu', null, 'China', '1907-01-17');
insert into customers (first_name, last_name, email, phone_number, city, postal_code, country, date_of_birth) values ('Leah', 'Wolfers', 'lwolfers28@google.nl', '566-351-1920', 'Pudong', null, 'China', '1936-10-23');
insert into customers (first_name, last_name, email, phone_number, city, postal_code, country, date_of_birth) values ('Aimil', 'Hoggan', 'ahoggan29@pcworld.com', '940-475-2816', 'Jiangjia', null, 'China', '1908-05-24');
insert into customers (first_name, last_name, email, phone_number, city, postal_code, country, date_of_birth) values ('Vicki', 'Trinkwon', 'vtrinkwon2a@discuz.net', '128-429-9670', 'Shangjing', null, 'China', '1914-07-21');
insert into customers (first_name, last_name, email, phone_number, city, postal_code, country, date_of_birth) values ('Claiborne', 'Maty', 'cmaty2b@chicagotribune.com', '542-673-0773', 'L''Union', '31244 CEDEX', 'France', '1977-06-02');
insert into customers (first_name, last_name, email, phone_number, city, postal_code, country, date_of_birth) values ('Dita', 'Hradsky', 'dhradsky2c@360.cn', '879-429-9788', 'Andaray', null, 'Peru', '1949-04-27');
insert into customers (first_name, last_name, email, phone_number, city, postal_code, country, date_of_birth) values ('Janet', 'Lingfoot', 'jlingfoot2d@columbia.edu', '328-702-1499', 'Znamenskoye', '303154', 'Russia', '1973-05-12');
insert into customers (first_name, last_name, email, phone_number, city, postal_code, country, date_of_birth) values ('Adelina', 'Cremins', 'acremins2e@aboutads.info', '103-347-0732', 'Licheń Stary', '62-563', 'Poland', '1984-05-10');
insert into customers (first_name, last_name, email, phone_number, city, postal_code, country, date_of_birth) values ('Noell', 'Todd', 'ntodd2f@ovh.net', '663-389-5563', 'Seria', null, 'Brunei', '1908-05-31');
insert into customers (first_name, last_name, email, phone_number, city, postal_code, country, date_of_birth) values ('North', 'Waker', 'nwaker2g@mediafire.com', '146-656-3134', 'Santa Lucía Cotzumalguapa', '05004', 'Guatemala', '1933-01-05');
insert into customers (first_name, last_name, email, phone_number, city, postal_code, country, date_of_birth) values ('Malissia', 'Dady', 'mdady2h@cargocollective.com', '301-727-5290', 'Huangtu', null, 'China', '1949-11-22');
insert into customers (first_name, last_name, email, phone_number, city, postal_code, country, date_of_birth) values ('Neile', 'Potts', 'npotts2i@google.it', '540-469-3032', 'Barreiras', '4990-434', 'Portugal', '1963-03-16');
insert into customers (first_name, last_name, email, phone_number, city, postal_code, country, date_of_birth) values ('Steve', 'Domini', 'sdomini2j@tinypic.com', '138-245-2669', 'Karmaskaly', '453150', 'Russia', '1969-02-06');
insert into customers (first_name, last_name, email, phone_number, city, postal_code, country, date_of_birth) values ('Eleanora', 'Adey', 'eadey2k@google.ru', '207-402-6666', 'Deder', null, 'Ethiopia', '1934-06-05');
insert into customers (first_name, last_name, email, phone_number, city, postal_code, country, date_of_birth) values ('Jean', 'Hallt', 'jhallt2l@house.gov', '957-705-5023', 'Cái Dầu', null, 'Vietnam', '1966-02-11');
insert into customers (first_name, last_name, email, phone_number, city, postal_code, country, date_of_birth) values ('Peder', 'Holwell', 'pholwell2m@nsw.gov.au', '877-863-4111', 'Bailuquan', null, 'China', '1932-07-08');
insert into customers (first_name, last_name, email, phone_number, city, postal_code, country, date_of_birth) values ('Ahmad', 'Ottery', 'aottery2n@nps.gov', '222-836-8123', 'Limulan', '9808', 'Philippines', '1931-06-27');
insert into customers (first_name, last_name, email, phone_number, city, postal_code, country, date_of_birth) values ('Beaufort', 'Gabitis', 'bgabitis2o@digg.com', '466-425-9995', 'Lok', null, 'Serbia', '1998-10-24');
insert into customers (first_name, last_name, email, phone_number, city, postal_code, country, date_of_birth) values ('Susan', 'Deery', 'sdeery2p@independent.co.uk', '330-990-6410', 'Asamboka', null, 'Indonesia', '1992-11-03');
insert into customers (first_name, last_name, email, phone_number, city, postal_code, country, date_of_birth) values ('Aldus', 'Stainson', 'astainson2q@theglobeandmail.com', '684-115-7233', 'Houzhai', null, 'China', '1915-02-03');
insert into customers (first_name, last_name, email, phone_number, city, postal_code, country, date_of_birth) values ('Donny', 'Brahan', 'dbrahan2r@columbia.edu', '417-552-4430', 'Edosaki', '300-0636', 'Japan', '1974-07-13');


insert into products (product_name, category, price, description, stock_quantity) values ('Tea Infuser', 'Kitchen', 220.66, 'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.

Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.

Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.', 9967);
insert into products (product_name, category, price, description, stock_quantity) values ('Taro Chips', 'Food - Snacks', 912.87, 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.

Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.

Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.', 3496);
insert into products (product_name, category, price, description, stock_quantity) values ('Elegant Lace Dress', 'Clothing - Dresses', 554.01, 'Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.

Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 493);
insert into products (product_name, category, price, description, stock_quantity) values ('Chili Lime Corn Chips', 'Food - Snacks', 843.2, 'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.

Fusce consequat. Nulla nisl. Nunc nisl.

Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.', 8478);
insert into products (product_name, category, price, description, stock_quantity) values ('Berries Medley', 'Food - Produce', 220.86, 'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.

Phasellus in felis. Donec semper sapien a libero. Nam dui.

Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.', 5452);
insert into products (product_name, category, price, description, stock_quantity) values ('Portable Jump Starter', 'Automotive', 756.79, 'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 6321);
insert into products (product_name, category, price, description, stock_quantity) values ('Vegan Chickpea Salad', 'Food - Prepared Foods', 939.07, 'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.', 2349);
insert into products (product_name, category, price, description, stock_quantity) values ('Red Lentils', 'Food - Grains', 63.52, 'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.

Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.

Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.', 1258);
insert into products (product_name, category, price, description, stock_quantity) values ('Adjustable Yoga Mat Strap', 'Fitness', 953.26, 'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.

Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.', 1978);
insert into products (product_name, category, price, description, stock_quantity) values ('Oven-Baked Parmesan Zucchini', 'Food - Frozen Vegetables', 950.93, 'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.', 649);
insert into products (product_name, category, price, description, stock_quantity) values ('Phone Screen Protector', 'Accessories', 716.48, 'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', 4691);
insert into products (product_name, category, price, description, stock_quantity) values ('Portable Massage Gun', 'Health', 701.45, 'Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.

Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 8460);
insert into products (product_name, category, price, description, stock_quantity) values ('Chipotle Black Bean Burger', 'Food - Meats', 626.28, 'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.

Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.

Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 7413);
insert into products (product_name, category, price, description, stock_quantity) values ('Athletic Jogging Jacket', 'Clothing - Outerwear', 830.42, 'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.', 5303);
insert into products (product_name, category, price, description, stock_quantity) values ('Fitbit Activity Tracker', 'Fitness', 900.59, 'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.', 9820);
insert into products (product_name, category, price, description, stock_quantity) values ('Electric Rice Cooker with Steamer', 'Kitchen', 464.76, 'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.

Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.

Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 7147);
insert into products (product_name, category, price, description, stock_quantity) values ('Pasta Maker', 'Kitchen', 18.88, 'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.', 4740);
insert into products (product_name, category, price, description, stock_quantity) values ('Quinoa', 'Food - Grains', 41.8, 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.

Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.

Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.', 8901);
insert into products (product_name, category, price, description, stock_quantity) values ('Portable Jump Starter', 'Automotive', 179.42, 'Sed ante. Vivamus tortor. Duis mattis egestas metus.

Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', 2358);
insert into products (product_name, category, price, description, stock_quantity) values ('Sesame Garlic Stir-Fry Sauce', 'Food - Sauces', 790.91, 'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.', 4722);
insert into products (product_name, category, price, description, stock_quantity) values ('Portable Air Pump', 'Outdoor', 387.33, 'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 2753);
insert into products (product_name, category, price, description, stock_quantity) values ('Organic Baby Spinach', 'Food - Produce', 550.48, 'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.', 9844);
insert into products (product_name, category, price, description, stock_quantity) values ('Instant Mashed Potatoes', 'Food - Sides', 132.79, 'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.

Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.

Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.', 728);
insert into products (product_name, category, price, description, stock_quantity) values ('Personal Blender', 'Kitchen', 706.72, 'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.

Sed ante. Vivamus tortor. Duis mattis egestas metus.

Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', 2780);
insert into products (product_name, category, price, description, stock_quantity) values ('Foam Roller for Muscle Recovery', 'Fitness', 577.14, 'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.

Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.', 7983);
insert into products (product_name, category, price, description, stock_quantity) values ('Bicycle Repair Kit', 'Outdoor', 750.93, 'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.

Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.

In congue. Etiam justo. Etiam pretium iaculis justo.', 7219);
insert into products (product_name, category, price, description, stock_quantity) values ('Scent Diffuser Oil', 'Home', 54.67, 'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.

Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.', 7699);
insert into products (product_name, category, price, description, stock_quantity) values ('Balsamic Fig Dressing', 'Food - Condiments', 892.87, 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.

Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.', 5858);
insert into products (product_name, category, price, description, stock_quantity) values ('Classic BBQ Sauce', 'Food - Condiments', 332.38, 'In congue. Etiam justo. Etiam pretium iaculis justo.

In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.

Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.', 4812);
insert into products (product_name, category, price, description, stock_quantity) values ('Chic Jumpsuit', 'Clothing - Jumpsuits', 236.68, 'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.

Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.

Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.', 5132);
insert into products (product_name, category, price, description, stock_quantity) values ('Classic Slim Fit Shirt', 'Clothing - Shirts', 450.66, 'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.

Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.', 7576);
insert into products (product_name, category, price, description, stock_quantity) values ('Travel Makeup Organizer', 'Beauty', 678.78, 'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.', 7234);
insert into products (product_name, category, price, description, stock_quantity) values ('Raspberry Lemonade Mix', 'Food - Beverages', 905.05, 'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.

Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.', 8702);
insert into products (product_name, category, price, description, stock_quantity) values ('Gardening Tool Belt', 'Garden', 146.03, 'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.

Fusce consequat. Nulla nisl. Nunc nisl.

Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.', 4789);
insert into products (product_name, category, price, description, stock_quantity) values ('Garlic Butter Sauce', 'Food - Condiments', 965.63, 'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.

In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 619);
insert into products (product_name, category, price, description, stock_quantity) values ('Pet Water Fountain', 'Pets', 365.36, 'Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', 6183);
insert into products (product_name, category, price, description, stock_quantity) values ('Garlic and Herb Cream Cheese', 'Food - Dairy', 587.4, 'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.', 4663);
insert into products (product_name, category, price, description, stock_quantity) values ('Dog Training Collar', 'Pets', 210.06, 'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.

Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.

Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.', 5837);
insert into products (product_name, category, price, description, stock_quantity) values ('Caramel Apple Chips', 'Food - Snacks', 330.75, 'Sed ante. Vivamus tortor. Duis mattis egestas metus.

Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', 173);
insert into products (product_name, category, price, description, stock_quantity) values ('Roasted Red Pepper Hummus', 'Food - Dips', 564.52, 'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.

In congue. Etiam justo. Etiam pretium iaculis justo.

In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.', 3936);
insert into products (product_name, category, price, description, stock_quantity) values ('Smart Thermostat with Wi-Fi', 'Smart Home', 729.3, 'Sed ante. Vivamus tortor. Duis mattis egestas metus.

Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', 5473);
insert into products (product_name, category, price, description, stock_quantity) values ('Slingback Sandals', 'Clothing - Footwear', 439.96, 'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.

Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.', 87);
insert into products (product_name, category, price, description, stock_quantity) values ('Tennis Racket', 'Fitness', 828.91, 'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.

In congue. Etiam justo. Etiam pretium iaculis justo.', 1647);
insert into products (product_name, category, price, description, stock_quantity) values ('Butternut Squash Ravioli', 'Food - Frozen Foods', 97.52, 'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.

Phasellus in felis. Donec semper sapien a libero. Nam dui.

Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.', 1759);
insert into products (product_name, category, price, description, stock_quantity) values ('Kids'' Crafting Station', 'Toys', 448.16, 'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.

Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.', 19);
insert into products (product_name, category, price, description, stock_quantity) values ('Watercolor Brush Pens', 'Art Supplies', 430.97, 'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.', 4516);
insert into products (product_name, category, price, description, stock_quantity) values ('Coconut Cashew Yogurt', 'Food - Dairy Alternatives', 677.05, 'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.

Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.', 6953);
insert into products (product_name, category, price, description, stock_quantity) values ('Chickpea Pancakes', 'Food - Frozen', 321.9, 'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.

Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.', 1311);
insert into products (product_name, category, price, description, stock_quantity) values ('Blender Bottle', 'Fitness', 750.66, 'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.

Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.', 7483);
insert into products (product_name, category, price, description, stock_quantity) values ('Overnight Duffle Bag', 'Travel', 217.21, 'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.

Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.

Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.', 2722);
insert into products (product_name, category, price, description, stock_quantity) values ('Insulated Coffee Mug', 'Kitchen', 493.41, 'Phasellus in felis. Donec semper sapien a libero. Nam dui.

Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.

Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.', 5171);
insert into products (product_name, category, price, description, stock_quantity) values ('Marinara Sauce', 'Food - Condiments', 875.02, 'Phasellus in felis. Donec semper sapien a libero. Nam dui.

Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.', 9652);
insert into products (product_name, category, price, description, stock_quantity) values ('Jasmine Rice', 'Food - Grains', 579.17, 'Phasellus in felis. Donec semper sapien a libero. Nam dui.

Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.', 6983);
insert into products (product_name, category, price, description, stock_quantity) values ('Butternut Squash Soup', 'Food - Soups', 549.8, 'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.

Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.

Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 5869);
insert into products (product_name, category, price, description, stock_quantity) values ('Crafting Kit', 'Art Supplies', 562.89, 'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.

Sed ante. Vivamus tortor. Duis mattis egestas metus.

Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', 9844);
insert into products (product_name, category, price, description, stock_quantity) values ('Salt and Pepper Grinder Set', 'Kitchen', 922.42, 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.

Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.', 6368);
insert into products (product_name, category, price, description, stock_quantity) values ('Underwater Camera', 'Photography', 123.89, 'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.

Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.', 1550);
insert into products (product_name, category, price, description, stock_quantity) values ('Avocado Oil', 'Food - Oils', 551.44, 'Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', 8286);
insert into products (product_name, category, price, description, stock_quantity) values ('Instant Camera', 'Photography', 201.96, 'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.

Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.

Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.', 9942);
insert into products (product_name, category, price, description, stock_quantity) values ('Pineapple Coconut Rice Mix', 'Food - Grains', 246.0, 'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.', 8699);
insert into products (product_name, category, price, description, stock_quantity) values ('Kids'' Trampoline', 'Toys', 68.46, 'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.

Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.', 4863);
insert into products (product_name, category, price, description, stock_quantity) values ('Sports Water Bottle with Infuser', 'Fitness', 540.95, 'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.

Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', 4633);
insert into products (product_name, category, price, description, stock_quantity) values ('Vegetable Fried Rice Mix', 'Food - Frozen Food', 638.95, 'Sed ante. Vivamus tortor. Duis mattis egestas metus.

Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.

Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.', 2493);
insert into products (product_name, category, price, description, stock_quantity) values ('LED Canopy Lights', 'Outdoor', 54.14, 'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.

Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.

Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.', 2617);
insert into products (product_name, category, price, description, stock_quantity) values ('Black Bean & Corn Salad', 'Food - Salads', 30.17, 'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 9986);
insert into products (product_name, category, price, description, stock_quantity) values ('Sesame Garlic Noodles', 'Food - Pasta', 783.19, 'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.

Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.

Phasellus in felis. Donec semper sapien a libero. Nam dui.', 4981);
insert into products (product_name, category, price, description, stock_quantity) values ('Spinach and Cheese Quiche', 'Food - Prepared Meals', 959.15, 'Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.

Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.

Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.', 923);
insert into products (product_name, category, price, description, stock_quantity) values ('Magnetic Spice Jars', 'Kitchen', 77.09, 'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.

Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.

Fusce consequat. Nulla nisl. Nunc nisl.', 2194);
insert into products (product_name, category, price, description, stock_quantity) values ('Multi-Cooker', 'Kitchen', 405.75, 'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.

Sed ante. Vivamus tortor. Duis mattis egestas metus.

Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', 9908);
insert into products (product_name, category, price, description, stock_quantity) values ('Air Fryer', 'Kitchen', 689.05, 'Sed ante. Vivamus tortor. Duis mattis egestas metus.

Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', 8528);
insert into products (product_name, category, price, description, stock_quantity) values ('Fettuccine Alfredo Dinner Kit', 'Food - Prepared Meals', 168.4, 'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.

Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.

Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', 4100);
insert into products (product_name, category, price, description, stock_quantity) values ('Electric Screwdriver', 'Tools', 337.0, 'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', 8810);
insert into products (product_name, category, price, description, stock_quantity) values ('Quinoa', 'Food - Grains', 41.68, 'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.

Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.

Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.', 5043);
insert into products (product_name, category, price, description, stock_quantity) values ('Sesame Garlic Noodles', 'Food - Pasta', 410.6, 'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.', 5109);
insert into products (product_name, category, price, description, stock_quantity) values ('Organic Brown Rice Cakes', 'Food - Snacks', 900.44, 'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.

Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.', 8569);
insert into products (product_name, category, price, description, stock_quantity) values ('Classic Watch', 'Accessories', 944.34, 'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.

In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 5987);
insert into products (product_name, category, price, description, stock_quantity) values ('Electric Hot Pot', 'Kitchen', 940.52, 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.

Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.

Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.', 6279);
insert into products (product_name, category, price, description, stock_quantity) values ('Honey Roasted Chickpeas', 'Food - Snacks', 634.07, 'Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.

Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 6308);
insert into products (product_name, category, price, description, stock_quantity) values ('Pet First Aid Kit', 'Pets', 545.34, 'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.

Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.

Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.', 5102);
insert into products (product_name, category, price, description, stock_quantity) values ('Folding Table', 'Outdoor', 212.3, 'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.

Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.', 6043);
insert into products (product_name, category, price, description, stock_quantity) values ('Two-Tone Windbreaker', 'Clothing - Outerwear', 309.36, 'Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', 5554);
insert into products (product_name, category, price, description, stock_quantity) values ('Vintage Graphic Tee', 'Clothing - Tops', 881.38, 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.

Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.

Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.', 2113);
insert into products (product_name, category, price, description, stock_quantity) values ('Elderberry Syrup', 'Food - Supplements', 248.39, 'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.', 5107);
insert into products (product_name, category, price, description, stock_quantity) values ('Smartphone Tripod with Remote', 'Photography', 564.65, 'Fusce consequat. Nulla nisl. Nunc nisl.

Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.

In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.', 7710);
insert into products (product_name, category, price, description, stock_quantity) values ('Marinated Artichokes', 'Food - Vegetables', 985.55, 'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.

Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.

In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 8401);
insert into products (product_name, category, price, description, stock_quantity) values ('Cinnamon Sugar Mix', 'Food - Baking', 158.68, 'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.

Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.', 7677);
insert into products (product_name, category, price, description, stock_quantity) values ('Asian Stir-Fry Kit', 'Food - Frozen Meals', 698.22, 'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.

In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 6266);
insert into products (product_name, category, price, description, stock_quantity) values ('LED Canopy Lights', 'Outdoor', 426.26, 'Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.

Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 9278);
insert into products (product_name, category, price, description, stock_quantity) values ('Fleece Hoodie', 'Clothing - Outerwear', 718.7, 'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.

Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.

Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.', 1444);
insert into products (product_name, category, price, description, stock_quantity) values ('Desk Lamp with USB Port', 'Office', 546.22, 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.

Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.

Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.', 1901);
insert into products (product_name, category, price, description, stock_quantity) values ('Sweet Potato Noodles', 'Food - Pasta', 177.3, 'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.

Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.

Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.', 1412);
insert into products (product_name, category, price, description, stock_quantity) values ('Fashionable Fanny Pack', 'Clothing - Accessories', 58.37, 'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.

Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 5389);
insert into products (product_name, category, price, description, stock_quantity) values ('Knitted Infinity Scarf', 'Clothing - Accessories', 8.35, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.

Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.', 7395);
insert into products (product_name, category, price, description, stock_quantity) values ('Carrot and Celery Sticks', 'Food - Produce', 45.26, 'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.', 7186);
insert into products (product_name, category, price, description, stock_quantity) values ('Electric Heat Press Machine', 'Crafts', 687.66, 'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.', 9631);
insert into products (product_name, category, price, description, stock_quantity) values ('Cotton Tote Bag Set', 'Accessories', 214.85, 'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.', 9379);
insert into products (product_name, category, price, description, stock_quantity) values ('Oversized Denim Shirt', 'Clothing - Shirts', 676.41, 'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.

Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.', 4378);
insert into products (product_name, category, price, description, stock_quantity) values ('Sunglasses', 'Accessories', 834.26, 'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.', 1459);
insert into products (product_name, category, price, description, stock_quantity) values ('Rechargeable Hand Warmer', 'Accessories', 217.89, 'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.', 9812);
insert into products (product_name, category, price, description, stock_quantity) values ('Spaghetti Sauce', 'Food - Canned Goods', 467.14, 'Sed ante. Vivamus tortor. Duis mattis egestas metus.

Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', 5512);



INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (70,1,20,'2021-06-28',4413.20,'pending');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (75,1,53,'2020-06-20',11694.98,'shipped');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (91,1,21,'2023-12-28',4633.86,'pending');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (31,1,13,'2023-03-25',2868.58,'pending');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (99,2,69,'2018-08-18',62988.03,'shipped');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (33,2,46,'2021-02-28',41992.02,'shipped');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (18,2,4,'2022-10-20',3651.48,'pending');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (94,2,30,'2024-01-24',27386.10,'shipped');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (100,2,62,'2020-12-13',56597.94,'delivered');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (1,3,28,'2021-10-09',15512.28,'pending');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (25,3,10,'2019-12-06',5540.10,'pending');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (51,3,74,'2022-12-08',40996.74,'shipped');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (49,3,44,'2020-10-10',24376.44,'pending');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (53,4,16,'2024-08-30',13491.20,'delivered');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (43,4,47,'2024-04-22',39630.40,'delivered');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (92,4,84,'2019-04-21',70828.80,'shipped');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (70,4,10,'2023-09-30',8432.00,'delivered');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (40,4,99,'2023-05-10',83476.80,'delivered');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (82,4,57,'2021-11-30',48062.40,'shipped');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (29,5,3,'2022-06-24',662.58,'shipped');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (90,5,72,'2020-04-23',15901.92,'delivered');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (98,5,99,'2021-05-08',21865.14,'pending');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (14,5,8,'2023-08-28',1766.88,'shipped');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (46,6,46,'2021-08-08',34812.34,'delivered');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (48,6,50,'2020-07-29',37839.50,'pending');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (83,6,25,'2019-10-21',18919.75,'shipped');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (68,6,95,'2020-12-25',71895.05,'pending');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (90,6,65,'2020-11-27',49191.35,'delivered');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (1,6,88,'2024-08-20',66597.52,'pending');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (5,6,32,'2018-08-26',24217.28,'pending');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (15,6,47,'2020-07-12',35569.13,'shipped');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (41,6,27,'2024-12-06',20433.33,'pending');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (66,7,48,'2018-07-15',45075.36,'delivered');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (22,7,22,'2022-12-12',20659.54,'pending');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (26,7,24,'2024-01-05',22537.68,'pending');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (34,7,72,'2020-11-18',67613.04,'delivered');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (9,7,9,'2021-01-04',8451.63,'delivered');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (39,7,32,'2018-08-25',30050.24,'pending');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (99,8,46,'2022-05-16',2921.92,'delivered');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (97,8,61,'2021-03-08',3874.72,'delivered');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (92,8,16,'2019-04-18',1016.32,'delivered');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (47,8,98,'2020-04-24',6224.96,'shipped');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (79,9,89,'2024-11-11',84840.14,'shipped');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (91,9,43,'2020-03-05',40990.18,'delivered');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (16,9,17,'2020-11-19',16205.42,'delivered');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (9,9,54,'2024-02-28',51476.04,'delivered');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (74,9,80,'2021-08-09',76260.80,'pending');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (61,9,3,'2022-11-13',2859.78,'pending');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (70,9,59,'2018-11-11',56242.34,'shipped');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (7,9,77,'2018-11-26',73401.02,'pending');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (32,10,55,'2018-03-22',52301.15,'delivered');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (57,10,67,'2018-06-21',63712.31,'shipped');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (13,10,33,'2020-09-24',31380.69,'shipped');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (71,10,54,'2021-10-30',51350.22,'shipped');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (84,11,26,'2019-08-01',18628.48,'delivered');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (82,11,42,'2018-12-01',30092.16,'shipped');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (78,11,73,'2019-09-07',52303.04,'delivered');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (92,11,76,'2019-12-06',54452.48,'shipped');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (23,11,34,'2019-11-19',24360.32,'shipped');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (99,11,42,'2019-11-04',30092.16,'shipped');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (84,12,29,'2024-12-19',20342.05,'delivered');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (11,12,78,'2022-03-08',54713.10,'shipped');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (69,13,64,'2020-05-02',40081.92,'shipped');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (11,13,19,'2024-09-23',11899.32,'delivered');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (58,13,16,'2021-03-18',10020.48,'pending');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (96,13,71,'2020-02-05',44465.88,'delivered');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (4,13,54,'2024-07-22',33819.12,'delivered');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (90,14,96,'2018-03-19',79720.32,'shipped');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (23,14,100,'2024-02-17',83042.00,'shipped');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (83,14,6,'2022-04-28',4982.52,'pending');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (70,14,35,'2024-07-05',29064.70,'delivered');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (43,14,73,'2019-01-29',60620.66,'shipped');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (43,15,62,'2020-10-19',55836.58,'pending');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (94,15,63,'2019-04-16',56737.17,'pending');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (33,15,16,'2018-08-09',14409.44,'delivered');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (4,15,18,'2020-06-10',16210.62,'delivered');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (58,15,2,'2022-03-31',1801.18,'pending');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (92,15,18,'2024-08-04',16210.62,'pending');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (42,15,31,'2023-08-19',27918.29,'pending');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (22,15,50,'2020-03-19',45029.50,'pending');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (83,15,26,'2021-11-27',23415.34,'pending');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (96,16,25,'2021-07-06',11619.00,'pending');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (93,16,92,'2020-09-02',42757.92,'pending');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (19,16,64,'2021-05-27',29744.64,'delivered');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (4,17,36,'2024-08-05',679.68,'delivered');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (23,17,95,'2024-10-26',1793.60,'pending');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (65,17,6,'2024-07-02',113.28,'delivered');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (24,17,16,'2023-03-13',302.08,'delivered');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (80,17,1,'2018-03-21',18.88,'shipped');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (98,17,94,'2021-07-06',1774.72,'delivered');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (3,18,50,'2021-08-12',2090.00,'pending');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (23,18,50,'2018-08-27',2090.00,'pending');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (22,18,94,'2018-09-22',3929.20,'pending');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (71,18,13,'2024-08-19',543.40,'shipped');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (58,18,93,'2020-09-24',3887.40,'shipped');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (50,18,20,'2019-08-18',836.00,'pending');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (23,19,80,'2023-05-19',14353.60,'delivered');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (19,19,52,'2021-10-04',9329.84,'pending');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (74,19,14,'2018-10-25',2511.88,'shipped');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (1,19,64,'2020-02-24',11482.88,'pending');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (26,19,45,'2021-10-17',8073.90,'delivered');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (57,19,25,'2023-03-19',4485.50,'delivered');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (69,20,24,'2019-09-23',18981.84,'shipped');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (72,20,64,'2020-04-17',50618.24,'pending');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (18,20,21,'2019-10-06',16609.11,'shipped');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (40,20,89,'2019-06-16',70390.99,'delivered');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (93,20,93,'2018-10-09',73554.63,'delivered');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (32,21,3,'2022-10-15',1161.99,'pending');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (22,21,21,'2018-10-18',8133.93,'pending');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (91,22,19,'2018-04-24',10459.12,'shipped');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (19,22,87,'2021-07-25',47891.76,'shipped');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (48,22,24,'2018-11-24',13211.52,'pending');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (85,22,71,'2018-01-04',39084.08,'delivered');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (77,22,8,'2019-01-12',4403.84,'shipped');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (38,22,21,'2024-01-28',11560.08,'pending');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (29,23,19,'2021-06-01',2523.01,'pending');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (36,23,51,'2022-08-26',6772.29,'pending');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (70,23,84,'2018-12-08',11154.36,'delivered');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (11,23,1,'2023-05-07',132.79,'shipped');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (30,23,44,'2021-04-30',5842.76,'delivered');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (60,23,94,'2018-09-03',12482.26,'shipped');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (56,23,91,'2019-10-22',12083.89,'delivered');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (53,23,84,'2018-03-02',11154.36,'delivered');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (28,24,46,'2018-05-16',32509.12,'delivered');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (19,24,46,'2020-06-11',32509.12,'delivered');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (17,24,47,'2018-09-13',33215.84,'delivered');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (28,24,82,'2021-03-16',57951.04,'delivered');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (31,24,18,'2022-11-12',12720.96,'pending');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (87,25,30,'2023-12-02',17314.20,'shipped');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (29,25,36,'2024-05-03',20777.04,'pending');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (76,25,95,'2021-04-26',54828.30,'shipped');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (58,25,34,'2021-12-09',19622.76,'pending');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (72,25,3,'2023-10-04',1731.42,'shipped');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (75,26,45,'2023-08-30',33791.85,'pending');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (77,26,55,'2018-05-23',41301.15,'delivered');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (73,26,85,'2021-06-21',63829.05,'pending');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (71,26,42,'2021-08-13',31539.06,'shipped');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (48,26,4,'2019-06-11',3003.72,'shipped');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (6,26,17,'2024-01-26',12765.81,'shipped');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (61,26,45,'2018-10-08',33791.85,'shipped');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (46,27,60,'2023-11-17',3280.20,'delivered');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (55,27,97,'2024-08-22',5302.99,'shipped');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (87,27,16,'2020-12-19',874.72,'pending');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (60,27,69,'2022-10-19',3772.23,'delivered');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (2,27,71,'2020-11-07',3881.57,'pending');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (78,28,70,'2024-02-08',62500.90,'delivered');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (76,28,46,'2021-04-02',41072.02,'shipped');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (49,28,11,'2022-03-26',9821.57,'pending');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (76,28,27,'2020-01-31',24107.49,'shipped');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (43,28,68,'2019-02-06',60715.16,'shipped');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (26,28,7,'2019-11-02',6250.09,'pending');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (29,28,11,'2023-04-21',9821.57,'pending');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (63,28,18,'2021-11-24',16071.66,'pending');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (20,28,17,'2019-02-04',15178.79,'shipped');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (65,28,16,'2020-05-30',14285.92,'delivered');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (20,28,68,'2019-02-23',60715.16,'pending');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (12,28,15,'2018-06-05',13393.05,'pending');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (53,28,65,'2018-10-06',58036.55,'delivered');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (25,29,73,'2023-04-26',24263.74,'delivered');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (87,29,13,'2022-07-07',4320.94,'pending');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (34,29,53,'2021-03-15',17616.14,'delivered');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (52,29,84,'2018-07-26',27919.92,'delivered');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (25,29,76,'2021-06-12',25260.88,'delivered');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (60,29,93,'2023-11-23',30911.34,'shipped');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (16,29,68,'2020-05-06',22601.84,'shipped');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (95,30,97,'2020-01-04',22957.96,'pending');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (22,30,50,'2024-08-22',11834.00,'delivered');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (88,30,3,'2022-06-20',710.04,'shipped');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (50,30,92,'2019-01-23',21774.56,'shipped');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (78,30,61,'2023-06-25',14437.48,'delivered');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (90,30,36,'2024-08-05',8520.48,'pending');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (50,30,30,'2020-02-08',7100.40,'delivered');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (39,30,60,'2019-01-16',14200.80,'pending');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (93,30,50,'2024-04-10',11834.00,'delivered');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (86,31,58,'2024-12-06',26138.28,'pending');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (49,31,88,'2023-12-22',39658.08,'pending');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (16,31,28,'2021-01-20',12618.48,'delivered');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (49,31,67,'2022-01-21',30194.22,'shipped');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (82,31,54,'2021-07-31',24335.64,'pending');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (93,31,19,'2022-09-03',8562.54,'pending');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (23,31,63,'2020-10-24',28391.58,'pending');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (81,31,43,'2019-08-07',19378.38,'delivered');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (46,31,94,'2022-06-25',42362.04,'pending');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (69,31,50,'2023-10-05',22533.00,'pending');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (15,31,81,'2020-11-24',36503.46,'pending');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (51,32,78,'2021-12-16',52944.84,'delivered');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (78,32,9,'2023-08-03',6109.02,'pending');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (81,32,63,'2018-04-09',42763.14,'shipped');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (19,32,57,'2020-12-07',38690.46,'delivered');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (4,32,90,'2020-11-29',61090.20,'pending');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (35,32,45,'2018-05-12',30545.10,'pending');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (35,33,100,'2022-10-31',90505.00,'shipped');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (5,33,13,'2019-06-06',11765.65,'pending');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (70,33,30,'2019-10-08',27151.50,'delivered');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (85,33,34,'2019-05-25',30771.70,'shipped');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (69,33,12,'2022-08-19',10860.60,'delivered');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (13,33,41,'2024-11-16',37107.05,'shipped');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (40,34,69,'2018-09-27',10076.07,'pending');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (42,34,56,'2018-03-09',8177.68,'delivered');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (83,34,98,'2023-10-14',14310.94,'delivered');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (100,35,31,'2022-08-16',29934.53,'pending');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (65,35,15,'2019-01-11',14484.45,'delivered');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (56,35,22,'2020-02-09',21243.86,'delivered');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (21,35,98,'2018-06-13',94631.74,'delivered');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (57,35,85,'2023-03-02',82078.55,'shipped');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (76,35,68,'2018-02-25',65662.84,'delivered');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (54,35,43,'2023-09-03',41522.09,'pending');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (75,35,54,'2022-06-12',52144.02,'pending');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (65,35,27,'2018-03-28',26072.01,'shipped');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (6,36,34,'2020-03-05',12422.24,'shipped');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (31,36,16,'2019-11-30',5845.76,'pending');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (78,36,16,'2019-02-09',5845.76,'pending');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (62,36,90,'2022-12-29',32882.40,'shipped');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (67,36,90,'2021-04-11',32882.40,'delivered');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (1,37,68,'2024-07-11',39943.20,'delivered');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (92,37,93,'2023-01-19',54628.20,'delivered');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (78,37,70,'2023-11-06',41118.00,'delivered');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (71,37,72,'2022-04-27',42292.80,'delivered');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (98,37,90,'2023-12-02',52866.00,'pending');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (56,37,57,'2019-03-11',33481.80,'delivered');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (19,37,31,'2021-05-19',18209.40,'pending');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (60,37,47,'2022-11-22',27607.80,'delivered');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (32,38,44,'2024-06-10',9242.64,'shipped');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (8,38,48,'2021-11-02',10082.88,'shipped');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (43,39,50,'2024-08-15',16537.50,'pending');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (70,39,48,'2019-12-17',15876.00,'pending');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (47,39,18,'2022-08-14',5953.50,'pending');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (55,39,87,'2022-08-24',28775.25,'delivered');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (64,39,16,'2020-09-24',5292.00,'shipped');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (33,39,12,'2019-03-03',3969.00,'delivered');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (68,39,78,'2021-12-18',25798.50,'pending');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (66,39,2,'2021-01-11',661.50,'shipped');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (2,40,70,'2022-04-08',39516.40,'delivered');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (79,40,29,'2021-11-29',16371.08,'delivered');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (92,40,21,'2021-03-22',11854.92,'delivered');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (12,40,87,'2021-07-03',49113.24,'delivered');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (1,40,65,'2022-12-31',36693.80,'pending');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (97,40,2,'2020-01-04',1129.04,'delivered');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (87,40,62,'2022-08-25',35000.24,'shipped');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (95,40,73,'2023-12-14',41209.96,'shipped');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (42,41,73,'2021-06-24',53238.90,'pending');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (52,41,24,'2022-05-31',17503.20,'delivered');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (46,42,74,'2023-09-17',32557.04,'delivered');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (13,42,53,'2021-05-19',23317.88,'shipped');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (75,42,30,'2023-09-29',13198.80,'shipped');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (59,42,27,'2021-04-20',11878.92,'pending');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (3,42,69,'2020-07-05',30357.24,'shipped');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (32,42,75,'2018-08-20',32997.00,'shipped');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (74,42,38,'2019-06-10',16718.48,'pending');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (19,43,88,'2023-02-21',72944.08,'shipped');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (66,43,70,'2024-10-06',58023.70,'shipped');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (94,43,64,'2020-05-28',53050.24,'shipped');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (99,43,96,'2021-12-26',79575.36,'delivered');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (25,43,62,'2021-10-26',51392.42,'delivered');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (73,43,99,'2023-07-09',82062.09,'delivered');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (81,43,20,'2021-08-25',16578.20,'delivered');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (15,43,22,'2019-12-11',18236.02,'pending');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (93,43,90,'2021-12-15',74601.90,'shipped');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (9,44,3,'2024-10-09',292.56,'pending');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (93,44,64,'2024-01-04',6241.28,'delivered');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (2,44,24,'2022-02-02',2340.48,'delivered');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (5,45,30,'2020-07-09',13444.80,'pending');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (4,45,12,'2020-11-01',5377.92,'shipped');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (91,45,73,'2020-01-05',32715.68,'shipped');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (72,45,64,'2021-09-29',28682.24,'delivered');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (38,45,57,'2024-10-16',25545.12,'pending');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (80,45,94,'2024-01-12',42127.04,'delivered');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (31,45,60,'2018-05-19',26889.60,'shipped');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (2,45,99,'2022-08-03',44367.84,'pending');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (4,46,7,'2019-02-16',3016.79,'shipped');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (10,46,3,'2019-09-27',1292.91,'pending');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (14,47,51,'2020-02-02',34529.55,'shipped');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (76,47,84,'2019-03-05',56872.20,'shipped');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (45,47,81,'2022-04-24',54841.05,'pending');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (79,47,2,'2021-10-22',1354.10,'pending');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (26,47,58,'2023-07-19',39268.90,'shipped');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (67,47,50,'2018-07-06',33852.50,'delivered');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (97,47,73,'2023-12-30',49424.65,'pending');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (83,47,56,'2021-06-23',37914.80,'shipped');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (30,47,92,'2022-03-09',62288.60,'pending');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (61,48,14,'2018-10-13',4506.60,'pending');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (35,48,65,'2023-01-19',20923.50,'pending');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (86,48,86,'2022-03-21',27683.40,'pending');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (27,48,25,'2022-11-14',8047.50,'shipped');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (38,48,80,'2022-06-13',25752.00,'shipped');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (86,48,64,'2018-09-03',20601.60,'pending');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (68,48,64,'2019-07-23',20601.60,'pending');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (79,48,45,'2019-08-21',14485.50,'shipped');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (5,48,86,'2021-03-11',27683.40,'delivered');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (47,49,73,'2024-07-23',54798.18,'delivered');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (61,49,23,'2022-10-20',17265.18,'pending');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (7,49,66,'2024-06-10',49543.56,'delivered');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (24,49,63,'2020-01-02',47291.58,'shipped');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (38,49,98,'2020-05-24',73564.68,'delivered');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (47,49,44,'2021-04-02',33029.04,'pending');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (74,49,17,'2024-05-26',12761.22,'pending');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (17,49,59,'2023-01-22',44288.94,'pending');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (62,49,76,'2024-01-19',57050.16,'pending');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (90,50,52,'2021-07-10',11294.92,'shipped');
INSERT INTO orders (customer_id,product_id,quantity,order_date,total_amount,order_status) VALUES (7,50,12,'2024-10-09',2606.52,'pending');