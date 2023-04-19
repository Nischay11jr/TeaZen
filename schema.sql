DROP TABLE IF EXISTS users;

CREATE TABLE users
(   user_id PRIMARY KEY,
    password TEXT NOT NULL
);


DROP TABLE IF EXISTS teas;

CREATE TABLE teas 
(   tea_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    price REAL NOT NULL,
    description TEXT,
    images TEXT
);

INSERT INTO teas (name, price, description, images)
VALUES ('Pure Zen', 8.99, 'Pure Zen is a tea that evokes a sense of calm and tranquility with every sip. This tea is
        carefully crafted using only the finest ingredients, such as premium green tea leaves, and infused with delicate flavors
        and aromas to create a smooth and subtle taste. The tea is known for its refreshing and uplifting qualities, making it
        a popular choice for those seeking a moment of peace and relaxation. With its subtle flavor and gentle aroma, Pure Zen
        is the perfect tea to enjoy during meditation, yoga, or any quiet moment of reflection. This tea is a testament to the
        art of tea-making, reflecting the simplicity and purity of nature. The gentle infusion of green tea leaves with subtle
        flavors and aromas creates a perfect harmony of taste and aroma, offering a truly zen-like experience with every sip.', 'purezen.jpg'),

        ('Green Harmony', 7.99, 'Green Harmony is a tea that embodies balance and harmony. This tea is carefully
        crafted using the finest green tea leaves, which are handpicked and then expertly blended with delicate herbs
        and spices to create a unique and balanced flavor. The tea has a light and refreshing taste with subtle hints
        of natural sweetness, making it a perfect choice for those who prefer a mild and soothing tea. With its
        delicate blend of green tea and herbs, Green Harmony is an ideal tea to enjoy any time of the day. The tea is
        known for its calming and soothing qualities, making it an excellent choice for moments when you need to relax
        and unwind. The gentle infusion of green tea leaves with natural herbs creates a perfect harmony of flavors,
        offering a truly harmonious and satisfying tea-drinking experience. Green Harmony is a tea that reflects the
        natural balance and harmony of the world around us. It is a testament to the art of tea-making and the beauty
        of nature, offering a truly delightful and harmonious tea-drinking experience.', 'greenharmony.png'), 
        
        ('Serene Rooibos', 7.79, 'Serene Rooibos is a tea that exudes a sense of calm and serenity. This tea is made
        from the finest Rooibos leaves, which are naturally caffeine-free and known for their rich, earthy flavor. The
        tea is carefully blended with natural ingredients, such as calming chamomile and soothing lavender, to create
        a delicate and balanced flavor. The result is a tea that is both calming and comforting, perfect for moments
        when you need to relax and unwind. The tea is known for its gentle, soothing properties, making it an ideal
        choice for those seeking a moment of peace and tranquility. With its natural ingredients and subtle flavor,
        Serene Rooibos is an excellent tea to enjoy before bedtime or during a relaxing evening. This tea is a
        testament to the power of nature and the art of tea-making. It reflects the natural serenity and calmness
        of the world around us, offering a truly serene and comforting tea-drinking experience. Whether you are
        looking to unwind after a long day or simply enjoy a moment of peace, Serene Rooibos is the perfect tea for you.', 'serenerooibos.png'), 

        ('Floral Bliss', 8.29, 'Floral Bliss is a tea that embodies the beauty and elegance of nature. This tea
        is carefully crafted using only the finest tea leaves, which are expertly blended with delicate floral 
        ingredients to create a harmonious and balanced flavor. The tea has a light and refreshing taste with subtle
        hints of natural sweetness, making it a perfect choice for those who prefer a mild and soothing tea.
        The blend of tea and floral ingredients creates a delicate and aromatic flavor that is both uplifting and
        refreshing. The tea is known for its calming and relaxing properties, making it an excellent choice for moments
        when you need to unwind and de-stress. With its gentle aroma and subtle flavor, Floral Bliss is an ideal tea
        to enjoy during quiet moments of relaxation or meditation. This tea is a tribute to the beauty and elegance of
        nature. It reflects the delicate balance of the natural world and the art of tea-making, offering a truly
        blissful and satisfying tea-drinking experience.', 'floralbliss.jpg'),

        ('Spiced Chai', 8.99, 'Spiced Chai is a tea that is rich, warm, and full of flavor. This tea is made using
        a blend of black tea leaves, which are carefully infused with a range of aromatic spices to create a bold and
        distinctive taste. The blend of spices typically includes cinnamon, cardamom, ginger, cloves, and black pepper,
        which combine to create a unique and spicy flavor profile. The tea also has a slightly sweet taste, which
        is balanced by the natural bitterness of the black tea. The tea is known for its invigorating and energizing
        properties, making it an ideal choice for those who need a little extra kick to start their day. With its bold
        flavor and warming properties, Spiced Chai is a popular choice for cold winter days or as an after-dinner treat.
        This tea is a testament to the rich history and cultural heritage of India, where it originated. It
        reflects the bold and spicy flavors of Indian cuisine and the art of tea-making, offering a truly satisfying
        and flavorful tea-drinking experience,Whether you are seeking a little extra warmth and energy or simply crave
        a bold and flavorful tea, Spiced Chai is sure to delight your senses and offer a truly satisfying tea-drinking
        experience.', 'spicedchai.png'),

        ('Citrus Sunrise', 6.79, 'Citrus Sunrise is a tea that offers a burst of fresh and invigorating flavors.
        This tea is expertly blended using high-quality tea leaves and a variety of natural citrus ingredients, creating
        a bold and tangy flavor profile. The blend of tea and citrus ingredients typically includes orange, lemon,
        and grapefruit, which combine to create a bright and refreshing taste. The tea also has a subtle sweetness that
        complements the tangy citrus flavors perfectly. The tea is known for its energizing and refreshing properties,
        making it an ideal choice for those who need a little pick-me-up. With its vibrant flavor and uplifting
        properties, Citrus Sunrise is a popular choice for morning tea or as a mid-day treat. This tea is a celebration
        of the beauty and freshness of nature. It embodies the vibrant colors and invigorating scents of a bright
        sunrise, offering a truly refreshing and satisfying tea-drinking experience.Savor the bright and invigorating
        flavors of Citrus Sunrise, and allow its refreshing qualities to energize your senses and brighten your day.', 'citrussunrise.png'),

        ('Persian Rose', 8.49, 'Persian Rose tea is a delicate and aromatic tea that is steeped in history and culture.
        This tea is expertly blended using high-quality black tea leaves and natural rose petals, creating a unique
        and luxurious flavor profile. The blend of black tea and rose petals creates a beautiful and fragrant aroma,
        which is complemented by the natural sweetness of the rose petals. The tea has a smooth and mellow taste,
        with a subtle floral undertone that lingers on the palate. The tea is known for its calming and soothing
        properties, making it an ideal choice for those looking for a moment of relaxation. With its delicate flavors
        and luxurious aroma, Persian Rose tea is a popular choice for afternoon tea or as a dessert accompaniment. This
        tea is a tribute to the rich cultural heritage of Persia, where the beauty and fragrance of roses have long
        been celebrated. It embodies the elegance and grace of Persian culture, offering a truly indulgent and
        satisfying tea-drinking experience. Indulge in the luxurious flavors and aromas of Persian Rose tea and
        experience the soothing and calming effects that only the finest quality tea leaves and natural rose
        petals can offer.', 'persianrose.png');

