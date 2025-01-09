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