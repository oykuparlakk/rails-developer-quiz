# **Başlarken**
Lütfen dökümanın tamamını okumadan geliştirmeye başlamayın.

Dökümanı düzgün bir şekilde görüntüleyebilmek için kullandığınız TextEditor veya IDE'nin 'Open Preview' özelliğini kullanın.

Kodunuzun yalın, okunur olmasına ve isimlendirmelerinize özen gösterin.

Takıldığınız yerlerde mevcut tarayıcınızda arama yapabilirsiniz. Fakat doğrudan AI destekli bir uygulama kullanmayınız.

Verdiğiniz cevaplar güncel dil modelleri(ChatGPT(3.5, 4o, O1-preview), Claude, Gemini) ile
hazırlanmış cevaplar ile karşılaştırılacaktır, yüksek benzerlik tespiti durumunda cevabınız
doğrudan geçersiz sayılacaktır.

--------------------------------------------------------------------------------------------

```ruby
class User
  attr_accessor :first_name, :last_name, :email
  attr_reader :status, :user_type

  STATUSES = [:pending, :active, :passive].freeze
  USER_TYPES = [:admin, :user].freeze

  def initialize(first_name:, last_name:, email:, status: :active, user_type: :user)
    @first_name = first_name
    @last_name = last_name
    self.email = email
    self.status = status
    self.user_type = user_type
  end

  def info
    "Full Name: #{full_name} - Email: #{email} - Status: #{status} - User Type: #{user_type}"
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def active?
    status == :active
  end

  def admin?
    user_type == :admin
  end

  private

  def email=(email)
    @email = email.downcase
  end

  def status=(status)
    unless STATUSES.include?(status)
      raise ArgumentError, "Invalid status: #{status}. Allowed: #{STATUSES.join(', ')}"
    end
    @status = status
  end

  def user_type=(user_type)
    unless USER_TYPES.include?(user_type)
      raise ArgumentError, "Invalid user type: #{user_type}. Allowed: #{USER_TYPES.join(', ')}"
    end
    @user_type = user_type
  end
end
```

<br><br>

### **Soru - 1**
Yukarıdaki User sınıfına göre, aşağıdaki kod parçaları teker teker çalıştırıldığında çıktıları ne olur?
Aşağıdaki **'Cevap - 1'** alanına cevapları yazınız?

--------------------------------------------------------------------------------------------
### **1.1**

    user = User.new(first_name: 'John', last_name: 'Doe', email: 'John@Doe.com')
    user.info

--------------------------------------------------------------------------------------------
### **1.2**

    user = User.new(first_name: 'John', last_name: 'Doe', email: 'John@Doe.com')
    user.active?

--------------------------------------------------------------------------------------------
### **1.3**

    user = User.new(first_name: 'John', last_name: 'Doe', email: 'John@Doe.com')
    user.admin?

--------------------------------------------------------------------------------------------
### **1.4**

    user = User.new(first_name: 'John', last_name: 'Doe', email: 'john@doe.com', status: :draft)
    user.info

--------------------------------------------------------------------------------------------
### **1.5**

    user = User.new(first_name: 'John', last_name: 'Doe', email: 'john@doe.com', user_type: :hr)
    user.info

<br>

### **Cevap - 1**

-------------------------------------------------------------------------------------------
### **1.1**
Full Name: John Doe - Email: john@doe.com - Status: active - User Type: user

-------------------------------------------------------------------------------------------
### **1.2**
true

-------------------------------------------------------------------------------------------
### **1.3**
false

--------------------------------------------------------------------------------------------
### **1.4**
`status=': Invalid status: draft. Allowed: pending, active, passive (ArgumentError)

    raise ArgumentError, "Invalid status: #{status}. Allowed: #{STATUSES.join(', ')}" unless STATUSES.include?(status)
          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
	from main.rb:13:in `initialize'
	from main.rb:54:in `new'
	from main.rb:54:in `<main>'
	
--------------------------------------------------------------------------------------------
### **1.5**

`user_type=': Invalid user type: hr. Allowed: admin, user (ArgumentError)

      raise ArgumentError, "Invalid user type: #{user_type}. Allowed: #{USER_TYPES.join(', ')}"
            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
	from main.rb:14:in `initialize'
	from main.rb:54:in `new'
	from main.rb:54:in `<main>'
	
	
--------------------------------------------------------------------------------------------

<br><br>

### **Soru - 2**
Yukarıdaki User sınıfında, first_name, last_name ve email gibi parametreler ile kullanıcı nesnesi oluşturulmaktadır.
Bu parametreler ile ilgili aşağıda belirtilen hata kontrollerini ekleyiniz.
Sorunun cevabını Github reponuzda paylaşınız. Reponun linkini aşağıdaki **'Cevap - 2'** alanında belirtiniz.

**Not:**

'rails-developer-quiz' adında Github reposu açınız.

'question_2' adında branch açarak cevabı bu reponuzda paylaşınız. Açtığınız branchı main branchına mergeleyiniz.

--------------------------------------------------------------------------------------------
### **2.1**
first_name parametresi boş (nil) olursa:

    => Hata tipi ArgumentError olmalı.
    => Hata mesajı: "First name cannot be nil" olmalı.

--------------------------------------------------------------------------------------------
### **2.2** 
last_name parametresi boş (nil) olursa:

    => Hata tipi ArgumentError olmalı.
    => Hata mesajı: "Last name cannot be nil" olmalı.

--------------------------------------------------------------------------------------------
### **2.3** 
email parametresi geçerli bir formatta olmalı. Geçerli bir email formatı için:

    => Email parametresi @ işareti içermelidir.
    => Hata tipi ArgumentError olmalı.
    => Hata mesajı: "Invalid email format. Email must contain '@'"

<br>

### **Cevap - 2**
--------------------------------------------------------------------------------------------
### **Github Link:**

https://github.com/oykuparlakk/rails-developer-quiz

--------------------------------------------------------------------------------------------

<br><br>

### **Soru - 3**
Aşağıdaki log çıktısını inceleyerek, uygulamadaki hatayı analiz edin. Hatanın nedeni nedir?
Aşağıdaki **'Cevap - 3'** alanına cevabınızı yazınız?

--------------------------------------------------------------------------------------------
```ruby
00:54:19 web.1    | [survivor] Started GET "/en/admin/settings/languages/new" for 127.0.0.1 at 2024-12-13 00:54:19 +0300
00:54:19 web.1    | [survivor]   Account Load (2.1ms)  SELECT "accounts".* FROM "accounts" WHERE "accounts"."status" = $1 AND "accounts"."slug" = $2 LIMIT $3  [["status", 1], ["slug", "survivor"], ["LIMIT", 1]]
00:54:19 web.1    | [survivor]   ↳ config/initializers/multi_db.rb:44:in `block (2 levels) in <main>'
00:54:19 web.1    | [survivor] Processing by Admin::Settings::LanguagesController#new as HTML
00:54:19 web.1    | [survivor]   Parameters: {"locale"=>"en"}
00:54:19 web.1    | [survivor]   User Load (2.4ms)  SELECT "users".* FROM "users" WHERE "users"."id" = $1 ORDER BY "users"."id" ASC LIMIT $2  [["id", 1], ["LIMIT", 1]]
00:54:19 web.1    | [survivor]   ↳ app/controllers/application_controller.rb:21:in `prepare_exception_notifier'
00:54:19 web.1    | [survivor]   Rendering layout layouts/admin/application.html.erb
00:54:19 web.1    | [survivor]   Rendering admin/settings/languages/new.html.erb within layouts/admin/application
00:54:19 web.1    | [survivor]   Rendered shared/_error_messages.html.erb (Duration: 0.1ms | Allocations: 48)
00:54:19 web.1    | [survivor]   Rendered admin/settings/languages/_form.html.erb (Duration: 3.6ms | Allocations: 2181)
00:54:19 web.1    | [survivor]   Rendered admin/settings/languages/new.html.erb within layouts/admin/application (Duration: 7.4ms | Allocations: 3049)
00:54:19 web.1    | [survivor]   Rendered layout layouts/admin/application.html.erb (Duration: 7.5ms | Allocations: 3146)
00:54:19 web.1    | [survivor] Completed 500 Internal Server Error in 18ms (ActiveRecord: 1.9ms | Allocations: 4684)
00:54:19 web.1    |
00:54:19 web.1    |
00:54:19 web.1    | [survivor]
00:54:19 web.1    | [survivor] ActionView::Template::Error (undefined method `code' for #<Language id: nil, flag_code: nil, language_code: nil, app_language: false, platform_language: false, default_language: false, created_at: nil, updated_at: nil>):
00:54:19 web.1    | [survivor]      6:       <% if language.new_record? %>
00:54:19 web.1    | [survivor]      7:         <div class="sm:col-span-2">
00:54:19 web.1    | [survivor]      8:           <div class="mt-2">
00:54:19 web.1    | [survivor]      9:             <%= form.input :code, collection: all_language(), label_method: :last, value_method: :first, prompt: t('prompt'), input_html: { data: { controller: 'select2' } } %>
00:54:19 web.1    | [survivor]     10:           </div>
00:54:19 web.1    | [survivor]     11:         </div>
00:54:19 web.1    | [survivor]     12:       <% end %>
00:54:19 web.1    | [survivor]
00:54:19 web.1    | [survivor] app/views/admin/settings/languages/_form.html.erb:9
00:54:19 web.1    | [survivor] app/views/admin/settings/languages/_form.html.erb:1
00:54:19 web.1    | [survivor] app/views/admin/settings/languages/new.html.erb:17
00:54:19 web.1    | [survivor] app/controllers/admin/application_controller.rb:12:in `block in set_time_zone'
00:54:19 web.1    | [survivor] app/controllers/admin/application_controller.rb:12:in `set_time_zone'
00:54:19 web.1    | [survivor] app/controllers/concerns/locale_switcher.rb:16:in `switch_locale'
```

<br>

### **Cevap - 3**
--------------------------------------------------------------------------------------------

language.new_record? 'a erişmek istemişiz orada böyle bir code methodu yok diyor ama bizim if'e girerkende gelen verimiz de sıkıntı var gibi gözüküyor. language id nil zaten bu nedenle hata veriyor.

### **Cevap:**
--------------------------------------------------------------------------------------------

<br><br>

### **Soru - 4**
Aşağıda User tablosuna kayıtlı 10 adet örnek veri bulunmaktadır.
Bu verilere göre aşağıdaki, sorguları Rails Active Record yöntemlerini(ORM) kullanarak yazınız ve çıktıları belirtiniz.
Aşağıdaki **'Cevap - 4'** alanına cevapları yazınız?

```ruby
Kullanıcı Verileri (Tablo: users)

users = [
  { id: 1, nickname: "johndoe123", first_name: "John",   last_name: "Doe", age: 28, status: "active", department: "IT" },
  { id: 2 ,nickname: "janesmith",  first_name: "Jane",   last_name: "Smith", age: 34, status: "active", department: "HR" },
  { id: 3, nickname: "markus99",   first_name: "Markus", last_name: "Brown", age: 45, status: "inactive", department: "" },
  { id: 4, nickname: "sarahK",     first_name: "Sarah",  last_name: "Khan", age: 31, status: "active", department: "Marketing" },
  { id: 5, nickname: "david007",   first_name: "David",  last_name: "Miller", age: 26, status: "passive", department: "Finance" },
  { id: 6, nickname: "lucylu89",   first_name: "Lucy",   last_name: "Johnson", age: 40, status: "active", department: "Legal" },
  { id: 7, nickname: "robert21",   first_name: "Robert", last_name: "Williams", age: 29, status: "active", department: "" },
  { id: 8, nickname: "emilyC",     first_name: "Emily",  last_name: "Clark", age: 36, status: "active", department: "Operations" },
  { id: 9, nickname: "steveO",     first_name: "Steve",  last_name: "Owen", age: 33, status: "inactive", department: "Support" },
  { id:10, nickname: "kellyD",     first_name: "Kelly",  last_name: "Davis", age: 25, status: "active", department: "Design" }
]
```

--------------------------------------------------------------------------------------------
### **4.1**

    status alanı "active" olan kullanıcıları listeleyen sorgu ve çıktıları.

--------------------------------------------------------------------------------------------
### **4.2**

    age alanı 30'dan küçük olan ve department'ı boş(nil) olan kullanıcıları listeleyen sorgu ve çıktıları.

--------------------------------------------------------------------------------------------
### **4.3**

    Tüm kullanıcıların nickname ve status bilgilerini getiren sorgu ve çıktıları.

--------------------------------------------------------------------------------------------
### **4.4**

    department alanı "HR" olan en fazla 2 kullanıcıyı listeleyen sorgu ve çıktıları.

--------------------------------------------------------------------------------------------
### **4.5**

    age alanı en büyük olan kullanıcının first_name, last_name ve age bilgilerini getiren sorgu ve çıktıları.

<br>

### **Cevap - 4**
--------------------------------------------------------------------------------------------
### **4.1**

User.where(status: "active")

--------------------------------------------------------------------------------------------
### **4.2** bak buna

User.where("age < ? AND department IS ?", 30, nil)

--------------------------------------------------------------------------------------------
### **4.3**

User.select("nickname","status")

--------------------------------------------------------------------------------------------
### **4.4**

User.where("department" : "HR").limit(2)

--------------------------------------------------------------------------------------------
### **4.5**

User.select("first_name","last_name","age").order(:age)

--------------------------------------------------------------------------------------------

<br><br>

### **Soru - 5**
Aşağıdaki soruyu Github reponuzda paylaşınız. Reponun linkini aşağıdaki **'Cevap - 5'** alanında belirtiniz.

**Not:**

'rails-developer-quiz' adında Github reposu açınız.

'question_5' adında branch açarak cevabı bu reponuzda paylaşınız. Açtığınız branchı main branchına mergeleyiniz.

--------------------------------------------------------------------------------------------
Bir Animal sınıfı ve iki alt sınıf (Dog ve Bird) oluşturun. Aşağıdaki işlevleri ekleyin:

**Animal sınıfında:**

    => name ve age adında iki özellik tanımlayın ve initialize metodu ile başlatın. Bu özellikler doğrudan değiştirilemesin.
    => speak adında bir metod tanımlayın. Bu metod "..." döndürsün.
    => show_age adında bir metod tanımlayın, "This animal is X years old." şeklinde bir çıktı versin. Belirtilen yaşa göre X değeri dinamik olsun.
    => calculate_human_years adında özel bir metod tanımlayın. Bu metod hayvanın yaşını 7 ile çarparak insan yılına çevirsin. Bu metoda sadece sınıf içinden erişilsin.
    => show_human_age adında bir metod tanımlayın, "X in human years." şeklinde bir çıktı versin. Hesaplanan yaşa göre X değeri dinamik olsun ve calculate_human_years metodunu kullansın.

**Dog ve Bird sınıflarında:**

    => Animal sınıfından miras alsın.
    => speak metodunu özelleştirin. Dog sınıfında "Woof! Woof!", Bird sınıfında "Chirp! Chirp!" döndürsün.
    => Hayvanların ayak sayılarını temsil eden @legs_count şeklinde bir değişken tanımlayın ve bu değişken değiştirilemesin.
    => show_legs adında bir metod tanımlayın. Bu metod "This animal has X legs." şeklinde bir çıktı versin. Belirtilen bacak sayısına göre X değeri dinamik olsun ve @legs_count değişkenini kullansın.

**Doğrulama(validation):**

    => Animal sınıfında, eğer name veya age parametrelerinden herhangi biri boş ise bir hata mesajı ile programı durduracak bir doğrulama ekleyin. "Name cannot be nil!", "Age cannot be nil!" şeklinde hata mesajlarını gösterin.
    => Animal sınıfında, age string ise bir hata mesajı ile programı durduracak bir doğrulama ekleyin. "Age cannot be string!" şeklinde hata mesajı gösterin.
    => Animal sınıfında, age negatif ise bir hata mesajı ile programı durduracak bir doğrulama ekleyin. "Age cannot be negative!" şeklinde hata mesajı gösterin.

**Beklenen Çıktılar:**

  **Dog sınıfından bir nesne oluşturulduğunda:**

    => speak: "Woof! Woof!"
    => show_age: "This animal is 3 years old."
    => show_human_age: "21 in human years."

  **Bird sınıfından bir nesne oluşturulduğunda:**

    => speak: "Chirp!! Chirp!!"
    => show_age: "This animal is 2 years old."
    => show_human_age: "14 in human years."

  **Hatalı veri girildiğinde doğrulama hata mesajları:**

    => Eğer age negatifse "Age cannot be negative!"
    => Eğer age boşsa "Age cannot be nil!"
    => Eğer name boşsa "Name cannot be nil!"

<br>

### **Cevap - 5**
--------------------------------------------------------------------------------------------
### **Github Link:**

https://github.com/oykuparlakk/rails-developer-quiz

--------------------------------------------------------------------------------------------

<br><br>

### **Soru - 6**
Aşağıdaki soruyu Github reponuzda paylaşınız. Reponun linkini aşağıdaki **'Cevap - 6'** alanında belirtiniz.

**Not:**

İsmini kendinizin belirleyeceği ayrı bir Github reposu açınız.

--------------------------------------------------------------------------------------------
Sizden aşağıdaki özellikleri içeren bir Rails uygulaması geliştirmeniz beklenmekte.

=> Veritabanı olarak PostgreSQL kullanın.

=> Arayüzde Tailwind/Bootstrap kullanın.

<br>

**Başlık:** Soru(Question), Cevap(Answer) Yönetimi

**Amaç:** Soruların ve cevapların oluşturulup yönetilebileceği bir Rails uygulaması.

**Tablolar:** Question ve Answer tabloları

**Alanlar:**

  **Question Tablosu:**

    => title(string): Sorunun başlığını belirtir. Boş olamaz ve en az 10 karakter olmalı.
    => content(string): Sorunun açıklamasını belirtir. Boş olamaz.
    => status(enum): Sorunun durumunu belirtir. Sadece "active", "passive" değerlerini alabilir. Varsayılan değeri "passive" olmalı.
    => code(string): Sorunun kodunu belirtir. Question verisi oluşturulurken otomatik olarak atanmalı. Benzersizdir(uniq) ve bir kere tanımlama yapıldıktan sonra değiştirilemez. Boş olamaz ve 6 karakterden oluşmalı.

  **Answer Tablosu:**

    => content(string): Cevabın açıklamasını belirtir. Boş olamaz.
    => is_correct(boolean): Doğru cevabı belirtir. Varsayılan değeri "false" olmalı.

**Gereksinimler:**

    => Her sorunun 4 cevabı olabilir. Eğer sorunun 4 cevabı yoksa ve sorunun durumu active yapılmak istenirse uyarı mesajı verilmeli.
    => Cevaplardan sadece 1 tanesi "true" olabilir.
    => Bir soru silindiğinde cevaplarıda otomatik silinmeli.
    => Sorular için CRUD işlemler yapılmalı. Sorunun görüntülendiği(show) ekranında soruya ait cevaplar tablo şeklinde listelenmeli.
    => Cevaplar için CRUD işlemler yapılmalı. Bir cevap oluşturulduktan sonra sorunun detayına(show) yönlenmeli.
    => Soruların listelendiği(index) ekranda sorunun status bilgisi yer almalı ve status'e göre filtreleme yapılabilmeli.
    => seed dosyasında 4 soru ve her sorunun 4 cevabı olacak şekilde 4 dummy kayıt tanımlanmalı.

<br>

### **Cevap - 6**
--------------------------------------------------------------------------------------------

https://github.com/oykuparlakk/question-answer







### **Github Link:**
--------------------------------------------------------------------------------------------
