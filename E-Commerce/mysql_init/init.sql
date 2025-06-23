-- mysql_init/init.sql
CREATE DATABASE IF NOT EXISTS ecommerce_daily_db;
USE ecommerce_daily_db;

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
	customer_id INT,
	product_id INT,
	quantity INT,
	order_date DATE,
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


insert into orders (customer_id, product_id, quantity, order_date) values (88, 62, 23, '2018-01-06');
insert into orders (customer_id, product_id, quantity, order_date) values (41, 19, 57, '2021-12-16');
insert into orders (customer_id, product_id, quantity, order_date) values (19, 57, 97, '2018-12-23');
insert into orders (customer_id, product_id, quantity, order_date) values (80, 20, 83, '2022-10-04');
insert into orders (customer_id, product_id, quantity, order_date) values (5, 74, 8, '2021-06-12');
insert into orders (customer_id, product_id, quantity, order_date) values (9, 54, 61, '2019-03-31');
insert into orders (customer_id, product_id, quantity, order_date) values (70, 65, 19, '2022-09-04');
insert into orders (customer_id, product_id, quantity, order_date) values (93, 54, 70, '2021-09-02');
insert into orders (customer_id, product_id, quantity, order_date) values (96, 31, 29, '2018-12-06');
insert into orders (customer_id, product_id, quantity, order_date) values (88, 30, 75, '2020-04-13');
insert into orders (customer_id, product_id, quantity, order_date) values (21, 62, 41, '2024-06-15');
insert into orders (customer_id, product_id, quantity, order_date) values (93, 16, 60, '2018-02-15');
insert into orders (customer_id, product_id, quantity, order_date) values (6, 39, 83, '2021-01-08');
insert into orders (customer_id, product_id, quantity, order_date) values (55, 72, 84, '2023-08-23');
insert into orders (customer_id, product_id, quantity, order_date) values (29, 88, 78, '2021-09-29');
insert into orders (customer_id, product_id, quantity, order_date) values (92, 50, 49, '2018-04-17');
insert into orders (customer_id, product_id, quantity, order_date) values (92, 3, 53, '2024-01-18');
insert into orders (customer_id, product_id, quantity, order_date) values (48, 87, 43, '2019-03-19');
insert into orders (customer_id, product_id, quantity, order_date) values (19, 56, 39, '2021-01-10');
insert into orders (customer_id, product_id, quantity, order_date) values (91, 60, 25, '2021-09-10');
insert into orders (customer_id, product_id, quantity, order_date) values (74, 7, 88, '2023-03-23');
insert into orders (customer_id, product_id, quantity, order_date) values (11, 14, 9, '2023-09-10');
insert into orders (customer_id, product_id, quantity, order_date) values (10, 83, 72, '2024-02-08');
insert into orders (customer_id, product_id, quantity, order_date) values (38, 37, 21, '2022-09-21');
insert into orders (customer_id, product_id, quantity, order_date) values (97, 98, 71, '2023-01-20');
insert into orders (customer_id, product_id, quantity, order_date) values (77, 63, 4, '2019-01-24');
insert into orders (customer_id, product_id, quantity, order_date) values (84, 14, 48, '2020-08-01');
insert into orders (customer_id, product_id, quantity, order_date) values (18, 50, 58, '2022-12-10');
insert into orders (customer_id, product_id, quantity, order_date) values (28, 45, 63, '2023-11-15');
insert into orders (customer_id, product_id, quantity, order_date) values (34, 7, 42, '2022-10-25');
insert into orders (customer_id, product_id, quantity, order_date) values (78, 70, 96, '2021-01-26');
insert into orders (customer_id, product_id, quantity, order_date) values (66, 99, 54, '2024-05-24');
insert into orders (customer_id, product_id, quantity, order_date) values (70, 44, 65, '2024-03-03');
insert into orders (customer_id, product_id, quantity, order_date) values (37, 82, 37, '2024-06-16');
insert into orders (customer_id, product_id, quantity, order_date) values (64, 62, 39, '2018-01-30');
insert into orders (customer_id, product_id, quantity, order_date) values (54, 97, 74, '2018-02-05');
insert into orders (customer_id, product_id, quantity, order_date) values (97, 9, 67, '2024-08-14');
insert into orders (customer_id, product_id, quantity, order_date) values (64, 19, 30, '2022-08-17');
insert into orders (customer_id, product_id, quantity, order_date) values (10, 65, 9, '2022-01-09');
insert into orders (customer_id, product_id, quantity, order_date) values (76, 81, 8, '2023-06-01');
insert into orders (customer_id, product_id, quantity, order_date) values (64, 100, 70, '2018-06-30');
insert into orders (customer_id, product_id, quantity, order_date) values (63, 95, 38, '2019-07-15');
insert into orders (customer_id, product_id, quantity, order_date) values (51, 86, 77, '2020-04-04');
insert into orders (customer_id, product_id, quantity, order_date) values (31, 96, 47, '2019-05-19');
insert into orders (customer_id, product_id, quantity, order_date) values (42, 71, 29, '2019-01-17');
insert into orders (customer_id, product_id, quantity, order_date) values (12, 13, 90, '2021-02-05');
insert into orders (customer_id, product_id, quantity, order_date) values (86, 13, 1, '2020-05-03');
insert into orders (customer_id, product_id, quantity, order_date) values (73, 79, 86, '2023-07-29');
insert into orders (customer_id, product_id, quantity, order_date) values (95, 55, 90, '2018-02-15');
insert into orders (customer_id, product_id, quantity, order_date) values (68, 84, 13, '2022-04-06');
insert into orders (customer_id, product_id, quantity, order_date) values (41, 10, 85, '2020-12-17');
insert into orders (customer_id, product_id, quantity, order_date) values (8, 15, 65, '2018-09-08');
insert into orders (customer_id, product_id, quantity, order_date) values (56, 59, 95, '2024-05-04');
insert into orders (customer_id, product_id, quantity, order_date) values (48, 39, 55, '2020-06-09');
insert into orders (customer_id, product_id, quantity, order_date) values (53, 64, 46, '2023-05-04');
insert into orders (customer_id, product_id, quantity, order_date) values (48, 61, 45, '2024-09-08');
insert into orders (customer_id, product_id, quantity, order_date) values (15, 77, 66, '2024-07-14');
insert into orders (customer_id, product_id, quantity, order_date) values (94, 61, 83, '2018-01-22');
insert into orders (customer_id, product_id, quantity, order_date) values (57, 96, 56, '2023-04-14');
insert into orders (customer_id, product_id, quantity, order_date) values (80, 17, 60, '2021-05-28');
insert into orders (customer_id, product_id, quantity, order_date) values (40, 96, 34, '2024-02-29');
insert into orders (customer_id, product_id, quantity, order_date) values (5, 27, 78, '2023-09-14');
insert into orders (customer_id, product_id, quantity, order_date) values (66, 23, 8, '2018-02-23');
insert into orders (customer_id, product_id, quantity, order_date) values (82, 70, 36, '2024-11-20');
insert into orders (customer_id, product_id, quantity, order_date) values (97, 14, 40, '2021-05-26');
insert into orders (customer_id, product_id, quantity, order_date) values (74, 97, 89, '2019-11-09');
insert into orders (customer_id, product_id, quantity, order_date) values (57, 25, 43, '2022-07-01');
insert into orders (customer_id, product_id, quantity, order_date) values (37, 63, 15, '2021-04-21');
insert into orders (customer_id, product_id, quantity, order_date) values (67, 38, 16, '2019-10-07');
insert into orders (customer_id, product_id, quantity, order_date) values (84, 42, 20, '2019-06-15');
insert into orders (customer_id, product_id, quantity, order_date) values (72, 17, 35, '2021-10-29');
insert into orders (customer_id, product_id, quantity, order_date) values (50, 12, 100, '2021-03-30');
insert into orders (customer_id, product_id, quantity, order_date) values (44, 19, 1, '2024-06-29');
insert into orders (customer_id, product_id, quantity, order_date) values (90, 81, 54, '2020-09-04');
insert into orders (customer_id, product_id, quantity, order_date) values (17, 3, 97, '2019-01-17');
insert into orders (customer_id, product_id, quantity, order_date) values (100, 47, 41, '2020-10-02');
insert into orders (customer_id, product_id, quantity, order_date) values (93, 45, 13, '2024-12-22');
insert into orders (customer_id, product_id, quantity, order_date) values (4, 80, 76, '2022-07-20');
insert into orders (customer_id, product_id, quantity, order_date) values (86, 32, 46, '2018-04-14');
insert into orders (customer_id, product_id, quantity, order_date) values (86, 99, 1, '2021-02-12');
insert into orders (customer_id, product_id, quantity, order_date) values (51, 69, 35, '2021-03-22');
insert into orders (customer_id, product_id, quantity, order_date) values (27, 1, 60, '2024-02-20');
insert into orders (customer_id, product_id, quantity, order_date) values (65, 41, 81, '2020-02-23');
insert into orders (customer_id, product_id, quantity, order_date) values (62, 17, 42, '2024-02-21');
insert into orders (customer_id, product_id, quantity, order_date) values (45, 10, 72, '2022-11-05');
insert into orders (customer_id, product_id, quantity, order_date) values (69, 86, 42, '2018-01-13');
insert into orders (customer_id, product_id, quantity, order_date) values (47, 6, 88, '2018-06-18');
insert into orders (customer_id, product_id, quantity, order_date) values (79, 87, 43, '2019-04-10');
insert into orders (customer_id, product_id, quantity, order_date) values (93, 69, 22, '2022-03-29');
insert into orders (customer_id, product_id, quantity, order_date) values (64, 34, 60, '2023-10-26');
insert into orders (customer_id, product_id, quantity, order_date) values (1, 3, 97, '2020-03-28');
insert into orders (customer_id, product_id, quantity, order_date) values (37, 81, 17, '2019-05-03');
insert into orders (customer_id, product_id, quantity, order_date) values (44, 20, 13, '2019-05-15');
insert into orders (customer_id, product_id, quantity, order_date) values (58, 87, 13, '2023-03-26');
insert into orders (customer_id, product_id, quantity, order_date) values (31, 72, 66, '2018-09-18');
insert into orders (customer_id, product_id, quantity, order_date) values (26, 79, 26, '2021-08-25');
insert into orders (customer_id, product_id, quantity, order_date) values (83, 1, 62, '2019-12-24');
insert into orders (customer_id, product_id, quantity, order_date) values (26, 19, 84, '2022-06-28');
insert into orders (customer_id, product_id, quantity, order_date) values (6, 97, 66, '2018-05-28');
insert into orders (customer_id, product_id, quantity, order_date) values (42, 47, 94, '2018-10-04');
insert into orders (customer_id, product_id, quantity, order_date) values (34, 61, 87, '2018-12-07');
insert into orders (customer_id, product_id, quantity, order_date) values (41, 91, 27, '2023-12-30');
insert into orders (customer_id, product_id, quantity, order_date) values (38, 61, 56, '2018-11-17');
insert into orders (customer_id, product_id, quantity, order_date) values (60, 43, 53, '2021-01-26');
insert into orders (customer_id, product_id, quantity, order_date) values (53, 70, 47, '2023-01-20');
insert into orders (customer_id, product_id, quantity, order_date) values (5, 48, 93, '2018-03-05');
insert into orders (customer_id, product_id, quantity, order_date) values (77, 70, 36, '2022-06-02');
insert into orders (customer_id, product_id, quantity, order_date) values (75, 25, 90, '2019-10-24');
insert into orders (customer_id, product_id, quantity, order_date) values (29, 38, 50, '2018-12-24');
insert into orders (customer_id, product_id, quantity, order_date) values (88, 3, 80, '2020-10-14');
insert into orders (customer_id, product_id, quantity, order_date) values (56, 55, 65, '2022-08-15');
insert into orders (customer_id, product_id, quantity, order_date) values (86, 10, 51, '2022-01-16');
insert into orders (customer_id, product_id, quantity, order_date) values (12, 21, 22, '2018-02-13');
insert into orders (customer_id, product_id, quantity, order_date) values (96, 50, 55, '2018-02-26');
insert into orders (customer_id, product_id, quantity, order_date) values (39, 100, 19, '2018-10-16');
insert into orders (customer_id, product_id, quantity, order_date) values (1, 13, 83, '2021-04-26');
insert into orders (customer_id, product_id, quantity, order_date) values (64, 33, 54, '2021-11-04');
insert into orders (customer_id, product_id, quantity, order_date) values (93, 19, 50, '2023-10-05');
insert into orders (customer_id, product_id, quantity, order_date) values (34, 56, 88, '2018-08-04');
insert into orders (customer_id, product_id, quantity, order_date) values (1, 46, 8, '2018-02-20');
insert into orders (customer_id, product_id, quantity, order_date) values (21, 65, 43, '2024-09-05');
insert into orders (customer_id, product_id, quantity, order_date) values (32, 44, 34, '2019-06-15');
insert into orders (customer_id, product_id, quantity, order_date) values (63, 42, 94, '2023-04-22');
insert into orders (customer_id, product_id, quantity, order_date) values (47, 81, 100, '2024-09-12');
insert into orders (customer_id, product_id, quantity, order_date) values (44, 2, 31, '2023-06-25');
insert into orders (customer_id, product_id, quantity, order_date) values (47, 70, 94, '2024-01-17');
insert into orders (customer_id, product_id, quantity, order_date) values (68, 10, 40, '2020-05-27');
insert into orders (customer_id, product_id, quantity, order_date) values (61, 10, 96, '2018-11-08');
insert into orders (customer_id, product_id, quantity, order_date) values (14, 62, 32, '2019-01-15');
insert into orders (customer_id, product_id, quantity, order_date) values (92, 6, 10, '2021-08-12');
insert into orders (customer_id, product_id, quantity, order_date) values (1, 17, 41, '2021-06-20');
insert into orders (customer_id, product_id, quantity, order_date) values (89, 52, 8, '2018-10-04');
insert into orders (customer_id, product_id, quantity, order_date) values (80, 96, 71, '2023-06-19');
insert into orders (customer_id, product_id, quantity, order_date) values (40, 94, 61, '2023-07-29');
insert into orders (customer_id, product_id, quantity, order_date) values (96, 67, 6, '2022-04-12');
insert into orders (customer_id, product_id, quantity, order_date) values (51, 17, 40, '2020-09-30');
insert into orders (customer_id, product_id, quantity, order_date) values (21, 85, 56, '2020-06-20');
insert into orders (customer_id, product_id, quantity, order_date) values (42, 1, 67, '2020-04-30');
insert into orders (customer_id, product_id, quantity, order_date) values (5, 64, 1, '2018-06-18');
insert into orders (customer_id, product_id, quantity, order_date) values (81, 49, 70, '2024-10-21');
insert into orders (customer_id, product_id, quantity, order_date) values (7, 45, 79, '2018-09-26');
insert into orders (customer_id, product_id, quantity, order_date) values (24, 40, 53, '2022-04-20');
insert into orders (customer_id, product_id, quantity, order_date) values (70, 62, 32, '2018-10-13');
insert into orders (customer_id, product_id, quantity, order_date) values (27, 60, 57, '2024-08-11');
insert into orders (customer_id, product_id, quantity, order_date) values (25, 56, 17, '2019-07-03');
insert into orders (customer_id, product_id, quantity, order_date) values (82, 79, 10, '2019-12-12');
insert into orders (customer_id, product_id, quantity, order_date) values (29, 42, 32, '2024-07-24');
insert into orders (customer_id, product_id, quantity, order_date) values (19, 28, 99, '2019-02-14');
insert into orders (customer_id, product_id, quantity, order_date) values (63, 68, 95, '2023-06-02');
insert into orders (customer_id, product_id, quantity, order_date) values (36, 73, 31, '2022-02-24');
insert into orders (customer_id, product_id, quantity, order_date) values (46, 58, 43, '2019-02-20');
insert into orders (customer_id, product_id, quantity, order_date) values (77, 26, 30, '2020-03-12');
insert into orders (customer_id, product_id, quantity, order_date) values (36, 45, 74, '2019-10-14');
insert into orders (customer_id, product_id, quantity, order_date) values (32, 52, 49, '2019-04-14');
insert into orders (customer_id, product_id, quantity, order_date) values (39, 41, 1, '2020-07-24');
insert into orders (customer_id, product_id, quantity, order_date) values (85, 100, 96, '2019-10-26');
insert into orders (customer_id, product_id, quantity, order_date) values (28, 82, 3, '2021-12-13');
insert into orders (customer_id, product_id, quantity, order_date) values (25, 99, 16, '2022-02-10');
insert into orders (customer_id, product_id, quantity, order_date) values (91, 97, 37, '2022-01-23');
insert into orders (customer_id, product_id, quantity, order_date) values (80, 41, 29, '2019-02-03');
insert into orders (customer_id, product_id, quantity, order_date) values (9, 23, 5, '2018-10-18');
insert into orders (customer_id, product_id, quantity, order_date) values (94, 74, 87, '2021-02-11');
insert into orders (customer_id, product_id, quantity, order_date) values (56, 57, 55, '2021-10-12');
insert into orders (customer_id, product_id, quantity, order_date) values (93, 4, 44, '2023-05-03');
insert into orders (customer_id, product_id, quantity, order_date) values (57, 61, 99, '2024-08-23');
insert into orders (customer_id, product_id, quantity, order_date) values (80, 11, 16, '2019-10-16');
insert into orders (customer_id, product_id, quantity, order_date) values (48, 19, 30, '2018-03-22');
insert into orders (customer_id, product_id, quantity, order_date) values (31, 37, 5, '2020-01-01');
insert into orders (customer_id, product_id, quantity, order_date) values (67, 67, 56, '2021-12-16');
insert into orders (customer_id, product_id, quantity, order_date) values (16, 85, 82, '2022-12-07');
insert into orders (customer_id, product_id, quantity, order_date) values (24, 24, 48, '2022-11-08');
insert into orders (customer_id, product_id, quantity, order_date) values (59, 57, 8, '2023-09-10');
insert into orders (customer_id, product_id, quantity, order_date) values (6, 47, 95, '2022-06-07');
insert into orders (customer_id, product_id, quantity, order_date) values (1, 45, 37, '2019-02-11');
insert into orders (customer_id, product_id, quantity, order_date) values (99, 61, 33, '2022-01-03');
insert into orders (customer_id, product_id, quantity, order_date) values (10, 49, 59, '2018-01-23');
insert into orders (customer_id, product_id, quantity, order_date) values (50, 64, 41, '2023-03-09');
insert into orders (customer_id, product_id, quantity, order_date) values (16, 75, 82, '2023-01-18');
insert into orders (customer_id, product_id, quantity, order_date) values (60, 24, 63, '2022-12-06');
insert into orders (customer_id, product_id, quantity, order_date) values (86, 74, 95, '2021-12-23');
insert into orders (customer_id, product_id, quantity, order_date) values (76, 34, 49, '2023-05-29');
insert into orders (customer_id, product_id, quantity, order_date) values (12, 93, 2, '2024-05-06');
insert into orders (customer_id, product_id, quantity, order_date) values (16, 74, 65, '2024-04-06');
insert into orders (customer_id, product_id, quantity, order_date) values (98, 32, 26, '2018-03-20');
insert into orders (customer_id, product_id, quantity, order_date) values (61, 57, 87, '2022-10-01');
insert into orders (customer_id, product_id, quantity, order_date) values (72, 93, 42, '2020-08-10');
insert into orders (customer_id, product_id, quantity, order_date) values (27, 4, 39, '2020-03-13');
insert into orders (customer_id, product_id, quantity, order_date) values (56, 17, 100, '2021-09-29');
insert into orders (customer_id, product_id, quantity, order_date) values (81, 96, 64, '2019-03-02');
insert into orders (customer_id, product_id, quantity, order_date) values (20, 10, 47, '2023-02-08');
insert into orders (customer_id, product_id, quantity, order_date) values (60, 85, 97, '2018-01-17');
insert into orders (customer_id, product_id, quantity, order_date) values (97, 94, 13, '2023-04-11');
insert into orders (customer_id, product_id, quantity, order_date) values (62, 61, 58, '2018-10-01');
insert into orders (customer_id, product_id, quantity, order_date) values (42, 32, 19, '2018-04-21');
insert into orders (customer_id, product_id, quantity, order_date) values (65, 49, 83, '2018-08-24');
insert into orders (customer_id, product_id, quantity, order_date) values (62, 49, 66, '2020-12-03');
insert into orders (customer_id, product_id, quantity, order_date) values (53, 29, 34, '2020-03-26');
insert into orders (customer_id, product_id, quantity, order_date) values (70, 42, 5, '2018-08-26');
insert into orders (customer_id, product_id, quantity, order_date) values (7, 47, 51, '2024-06-09');
insert into orders (customer_id, product_id, quantity, order_date) values (78, 8, 83, '2024-11-01');
insert into orders (customer_id, product_id, quantity, order_date) values (21, 42, 38, '2022-08-26');
insert into orders (customer_id, product_id, quantity, order_date) values (53, 23, 32, '2023-02-16');
insert into orders (customer_id, product_id, quantity, order_date) values (15, 55, 60, '2024-02-18');
insert into orders (customer_id, product_id, quantity, order_date) values (3, 56, 41, '2020-02-22');
insert into orders (customer_id, product_id, quantity, order_date) values (60, 10, 70, '2022-09-12');
insert into orders (customer_id, product_id, quantity, order_date) values (65, 17, 70, '2018-04-21');
insert into orders (customer_id, product_id, quantity, order_date) values (79, 2, 75, '2020-03-02');
insert into orders (customer_id, product_id, quantity, order_date) values (36, 98, 44, '2018-03-10');
insert into orders (customer_id, product_id, quantity, order_date) values (29, 39, 53, '2024-09-21');
insert into orders (customer_id, product_id, quantity, order_date) values (33, 90, 72, '2022-01-02');
insert into orders (customer_id, product_id, quantity, order_date) values (96, 30, 92, '2019-01-22');
insert into orders (customer_id, product_id, quantity, order_date) values (57, 67, 66, '2022-04-25');
insert into orders (customer_id, product_id, quantity, order_date) values (63, 18, 61, '2024-07-17');
insert into orders (customer_id, product_id, quantity, order_date) values (55, 35, 15, '2020-06-23');
insert into orders (customer_id, product_id, quantity, order_date) values (53, 80, 29, '2018-10-31');
insert into orders (customer_id, product_id, quantity, order_date) values (45, 58, 1, '2022-04-12');
insert into orders (customer_id, product_id, quantity, order_date) values (81, 82, 65, '2023-09-01');
insert into orders (customer_id, product_id, quantity, order_date) values (27, 86, 41, '2021-06-15');
insert into orders (customer_id, product_id, quantity, order_date) values (51, 27, 47, '2022-03-09');
insert into orders (customer_id, product_id, quantity, order_date) values (65, 7, 33, '2019-12-31');
insert into orders (customer_id, product_id, quantity, order_date) values (64, 30, 91, '2018-05-23');
insert into orders (customer_id, product_id, quantity, order_date) values (93, 84, 100, '2020-09-13');
insert into orders (customer_id, product_id, quantity, order_date) values (21, 51, 91, '2021-08-24');
insert into orders (customer_id, product_id, quantity, order_date) values (85, 33, 41, '2024-07-23');
insert into orders (customer_id, product_id, quantity, order_date) values (22, 50, 10, '2019-10-23');
insert into orders (customer_id, product_id, quantity, order_date) values (15, 71, 57, '2020-07-14');
insert into orders (customer_id, product_id, quantity, order_date) values (97, 32, 91, '2024-11-18');
insert into orders (customer_id, product_id, quantity, order_date) values (88, 95, 86, '2018-01-29');
insert into orders (customer_id, product_id, quantity, order_date) values (73, 28, 68, '2021-05-22');
insert into orders (customer_id, product_id, quantity, order_date) values (63, 90, 78, '2024-07-05');
insert into orders (customer_id, product_id, quantity, order_date) values (84, 34, 10, '2019-06-28');
insert into orders (customer_id, product_id, quantity, order_date) values (71, 17, 99, '2020-11-19');
insert into orders (customer_id, product_id, quantity, order_date) values (38, 85, 83, '2024-08-08');
insert into orders (customer_id, product_id, quantity, order_date) values (14, 100, 24, '2020-07-28');
insert into orders (customer_id, product_id, quantity, order_date) values (67, 90, 62, '2021-08-23');
insert into orders (customer_id, product_id, quantity, order_date) values (9, 61, 15, '2024-01-16');
insert into orders (customer_id, product_id, quantity, order_date) values (81, 60, 59, '2023-11-01');
insert into orders (customer_id, product_id, quantity, order_date) values (6, 48, 35, '2020-06-17');
insert into orders (customer_id, product_id, quantity, order_date) values (50, 68, 39, '2022-03-07');
insert into orders (customer_id, product_id, quantity, order_date) values (61, 86, 44, '2018-05-27');
insert into orders (customer_id, product_id, quantity, order_date) values (13, 86, 9, '2024-06-25');
insert into orders (customer_id, product_id, quantity, order_date) values (59, 58, 36, '2024-03-29');
insert into orders (customer_id, product_id, quantity, order_date) values (92, 59, 49, '2020-06-10');
insert into orders (customer_id, product_id, quantity, order_date) values (31, 5, 84, '2022-03-25');
insert into orders (customer_id, product_id, quantity, order_date) values (19, 58, 83, '2021-02-26');
insert into orders (customer_id, product_id, quantity, order_date) values (86, 68, 92, '2019-12-12');
insert into orders (customer_id, product_id, quantity, order_date) values (65, 65, 13, '2020-07-22');
insert into orders (customer_id, product_id, quantity, order_date) values (42, 61, 3, '2021-06-28');
insert into orders (customer_id, product_id, quantity, order_date) values (14, 62, 79, '2019-11-11');
insert into orders (customer_id, product_id, quantity, order_date) values (11, 93, 78, '2021-09-03');
insert into orders (customer_id, product_id, quantity, order_date) values (43, 33, 31, '2019-12-18');
insert into orders (customer_id, product_id, quantity, order_date) values (56, 30, 5, '2022-12-05');
insert into orders (customer_id, product_id, quantity, order_date) values (66, 95, 80, '2022-09-11');
insert into orders (customer_id, product_id, quantity, order_date) values (69, 30, 83, '2019-07-12');
insert into orders (customer_id, product_id, quantity, order_date) values (70, 86, 79, '2021-05-18');
insert into orders (customer_id, product_id, quantity, order_date) values (69, 97, 77, '2024-10-26');
insert into orders (customer_id, product_id, quantity, order_date) values (73, 31, 70, '2022-07-12');
insert into orders (customer_id, product_id, quantity, order_date) values (12, 99, 92, '2018-05-10');
insert into orders (customer_id, product_id, quantity, order_date) values (59, 79, 38, '2024-10-23');
insert into orders (customer_id, product_id, quantity, order_date) values (45, 27, 27, '2018-07-05');
insert into orders (customer_id, product_id, quantity, order_date) values (9, 13, 42, '2023-01-13');
insert into orders (customer_id, product_id, quantity, order_date) values (99, 63, 30, '2022-08-16');
insert into orders (customer_id, product_id, quantity, order_date) values (46, 86, 9, '2019-09-06');
insert into orders (customer_id, product_id, quantity, order_date) values (68, 20, 69, '2019-04-19');
insert into orders (customer_id, product_id, quantity, order_date) values (32, 85, 37, '2019-06-10');
insert into orders (customer_id, product_id, quantity, order_date) values (65, 91, 11, '2022-01-01');
insert into orders (customer_id, product_id, quantity, order_date) values (55, 99, 55, '2024-11-21');
insert into orders (customer_id, product_id, quantity, order_date) values (83, 14, 6, '2020-11-08');
insert into orders (customer_id, product_id, quantity, order_date) values (9, 50, 58, '2018-10-10');
insert into orders (customer_id, product_id, quantity, order_date) values (60, 2, 34, '2024-08-09');
insert into orders (customer_id, product_id, quantity, order_date) values (41, 39, 17, '2020-05-27');
insert into orders (customer_id, product_id, quantity, order_date) values (38, 80, 46, '2020-06-18');
insert into orders (customer_id, product_id, quantity, order_date) values (68, 2, 62, '2020-05-26');
insert into orders (customer_id, product_id, quantity, order_date) values (64, 60, 7, '2020-12-03');
insert into orders (customer_id, product_id, quantity, order_date) values (63, 60, 24, '2023-12-19');
insert into orders (customer_id, product_id, quantity, order_date) values (15, 78, 19, '2020-10-09');
insert into orders (customer_id, product_id, quantity, order_date) values (54, 50, 61, '2021-03-30');
insert into orders (customer_id, product_id, quantity, order_date) values (7, 56, 17, '2024-07-29');
insert into orders (customer_id, product_id, quantity, order_date) values (74, 61, 1, '2022-05-13');
insert into orders (customer_id, product_id, quantity, order_date) values (44, 12, 32, '2020-11-18');
insert into orders (customer_id, product_id, quantity, order_date) values (66, 16, 1, '2022-03-10');
insert into orders (customer_id, product_id, quantity, order_date) values (46, 45, 80, '2023-11-01');
insert into orders (customer_id, product_id, quantity, order_date) values (70, 59, 86, '2022-09-16');
insert into orders (customer_id, product_id, quantity, order_date) values (62, 56, 24, '2019-11-27');
insert into orders (customer_id, product_id, quantity, order_date) values (25, 7, 83, '2021-05-08');
insert into orders (customer_id, product_id, quantity, order_date) values (24, 28, 15, '2024-04-30');
insert into orders (customer_id, product_id, quantity, order_date) values (30, 10, 73, '2022-05-04');
insert into orders (customer_id, product_id, quantity, order_date) values (5, 8, 28, '2021-05-09');
insert into orders (customer_id, product_id, quantity, order_date) values (55, 6, 35, '2018-10-03');
insert into orders (customer_id, product_id, quantity, order_date) values (56, 65, 77, '2020-01-16');
insert into orders (customer_id, product_id, quantity, order_date) values (20, 44, 86, '2021-05-15');
insert into orders (customer_id, product_id, quantity, order_date) values (90, 86, 31, '2021-05-21');
insert into orders (customer_id, product_id, quantity, order_date) values (64, 42, 26, '2020-06-22');
insert into orders (customer_id, product_id, quantity, order_date) values (26, 53, 28, '2023-10-21');
insert into orders (customer_id, product_id, quantity, order_date) values (24, 72, 93, '2021-08-15');
insert into orders (customer_id, product_id, quantity, order_date) values (86, 33, 64, '2023-09-19');
insert into orders (customer_id, product_id, quantity, order_date) values (84, 79, 9, '2023-09-30');
insert into orders (customer_id, product_id, quantity, order_date) values (98, 86, 43, '2019-05-15');
insert into orders (customer_id, product_id, quantity, order_date) values (74, 6, 43, '2023-12-06');
insert into orders (customer_id, product_id, quantity, order_date) values (92, 23, 66, '2022-06-01');
