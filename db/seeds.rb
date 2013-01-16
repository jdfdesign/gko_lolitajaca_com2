# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

I18n.locale = :en
@site = Site.first

def create_image(name)
  image = @site.images.find_by_image_name("product_#{name}-jpg")
  return image if image
  image = @site.images.create!(:image => File.new("#{File.dirname(__FILE__)}/images/product_#{name}.jpg"))
  return image
end

Category.all.map(&:delete)
Product.all.map(&:delete)
Fabric.all.map(&:delete)
Print.all.map(&:delete)

@catalog = @site.catalogs.find_or_create_by_name!(:title => "Collection", :name => "catalog", :parent_id => 1)

new_product_category = @catalog.categories.create(:name => "new", :title => "New Shapes")
best_product_category = @catalog.categories.create(:name => "best", :title => "Best Sellers")
cotton_limited_product_category = @catalog.categories.create(:name => "cotton_limited", :title => "Cotton Limited Edition")
silk_limited_product_category = @catalog.categories.create(:name => "silk_limited", :title => "Silk Limited Edition")

fabric_category = @catalog.categories.create!(:name => "fabric", :title => "Fabrics")
fabric_cotton_category = fabric_category.children.create!(:name => "fabric_cotton_category", :title => "Cotton", :section_id => @catalog.id)
fabric_silk_category = fabric_category.children.create(:name => "fabric_silk_category", :title => "Silk", :section_id => @catalog.id)
fabric_mix_category = fabric_category.children.create(:name => "fabric_mix_category", :title => "Mix", :section_id => @catalog.id)

shape_category = @catalog.categories.create(:name => "shapes", :title => "Shapes")
dress_shape_category = shape_category.children.create(:name => "dress_shape_category", :title => "Dress", :section_id => @catalog.id)
skirt_shape_category = shape_category.children.create(:name => "skirt_shape_category", :title => "Skirt", :section_id => @catalog.id)
pant_shape_category = shape_category.children.create(:name => "pant_shape_category", :title => "Pant / Short", :section_id => @catalog.id)
top_shape_category = shape_category.children.create(:name => "top_shape_category", :title => "Top", :section_id => @catalog.id)
tunic_shape_category = shape_category.children.create(:name => "tunic_shape_category", :title => "Tunic", :section_id => @catalog.id)
kimono_shape_category = shape_category.children.create(:name => "kimono_shape_category", :title => "Kimono", :section_id => @catalog.id)
combi_shape_category = shape_category.children.create(:name => "combi_shape_category", :title => "Combi", :section_id => @catalog.id)
poncho_shape_category = shape_category.children.create(:name => "poncho_shape_category", :title => "Poncho / Cover", :section_id => @catalog.id)
bikini_shape_category = shape_category.children.create(:name => "bikini_shape_category", :title => "Bikini", :section_id => @catalog.id)

fabric_eyelet_cotton = @site.fabrics.create(:name => "eyelet_cotton", :presentation => "Eyelet Cotton")
fabric_eyelet_cotton.prints.create(:name => "eyelet_cotton_white", :presentation => "Eyelet Cotton White")

fabric_lace = @site.fabrics.create(:name => "fabric_lace", :presentation => "Net Lace");
fabric_lace.prints.create(:name => "lace_white", :presentation => "White");

fabric_crochet = @site.fabrics.create(:name => "fabric_crochet", :presentation => "Crochet");
fabric_crochet.prints.create(:name => "crochet_white", :presentation => "Ivory");

fabric_satin_silk = @site.fabrics.create(:name => "fabric_satin_silk", :presentation => "Satin silk print");
fabric_satin_silk.prints.create(:name => "print_chinese_fushia", :presentation => "Chinese Fushia");
fabric_satin_silk.prints.create(:name => "print_babel_lagon", :presentation => "Babel Lagoon");
fabric_satin_silk.prints.create(:name => "print_babel_black", :presentation => "Babel Black");
fabric_satin_silk.prints.create(:name => "print_jardin_delices", :presentation => "Jardin des Delices Mauve Powder");
fabric_satin_silk.prints.create(:name => "print_jewelry_pearl_grey", :presentation => "Jewelry Pearl Grey");

fabric_crepe_chiffon = @site.fabrics.create(:name => "fabric_crepe_chiffon", :presentation => "Crepe Chiffon Slik print");
fabric_crepe_chiffon.prints.create(:name => "print_crepe_chinese_fushia", :presentation => "Chinese Fushia");
fabric_crepe_chiffon.prints.create(:name => "print_crepe_babel_lagon", :presentation => "Babel Lagoon");
fabric_crepe_chiffon.prints.create(:name => "print_crepe_jardin_delices", :presentation => "Jardin des Delices Mauve Powder");
fabric_crepe_chiffon.prints.create(:name => "print_crepe_jewelry_pearl_grey", :presentation => "Jewelry Pearl Grey");

fabric_cotton_lurex = @site.fabrics.create(:name => "fabric_cotton_lurex", :presentation => "Cotton Voile, Gauze and Lurex");
fabric_cotton_lurex.prints.create(:name => "print_daizy_fushia", :presentation => "Daizy Fushia");
fabric_cotton_lurex.prints.create(:name => "print_lotus_blue", :presentation => "Lotus Blue");

fabric_lucknow = @site.fabrics.create(:name => "fabric_lucknow", :presentation => "Lucknow Silk Chiffon Hand Made Embroidery");
fabric_lucknow.prints.create(:name => "print_beige_powder", :presentation => "Beige Powder");
fabric_lucknow.prints.create(:name => "print_pink_powder", :presentation => "Pink Powder");
fabric_lucknow.prints.create(:name => "print_white_powder", :presentation => "White");

fabric_hakoba_cotton = @site.fabrics.create(:name => "fabric_hakoba_cotton", :presentation => "Hakoba Cotton Embroidery");
fabric_hakoba_cotton.prints.create(:name => "print_pink_pastel", :presentation => "Pink Pastel");
fabric_hakoba_cotton.prints.create(:name => "print_yellow_pastel", :presentation => "Yellow Pastel");
fabric_hakoba_cotton.prints.create(:name => "print_blue_pastel", :presentation => "Blue Pastel");

fabric_mix_cotton_ltd = @site.fabrics.create(:name => "fabric_mix_cotton_ltd", :presentation => "Mix Cotton, Block Print, Dots and Vichy");
fabric_mix_cotton_ltd.prints.create(:name => "mix_2_parma_moka", :presentation => "Mix 2 Parma/Moka");
fabric_mix_cotton_ltd.prints.create(:name => "mix_3_turquoise_purple", :presentation => "Mix 3 Turquoise/Purple");
fabric_mix_cotton_ltd.prints.create(:name => "mix_5_turquoise_white", :presentation => "Mix 5 Turquoise/White");
fabric_mix_cotton_ltd.prints.create(:name => "mix_6_pink_moka", :presentation => "Mix 6 Pink/Moka");
fabric_mix_cotton_ltd.prints.create(:name => "mix_7_green_orange", :presentation => "Mix 7 Green/Orange");

fabric_mix_satin_silk_crepe = @site.fabrics.create(:name => "fabric_mix_satin_silk_crepe", :presentation => "Mix Satin Silk, Crepe Chiffon Silk");
fabric_mix_satin_silk_crepe.prints.create(:name => "print_mix_chinese_fushia", :presentation => "Chinese Fushia");
fabric_mix_satin_silk_crepe.prints.create(:name => "print_mix_babel_lagon", :presentation => "Babel Lagoon");
fabric_mix_satin_silk_crepe.prints.create(:name => "print_mix_jardin_delices", :presentation => "Jardin des Delices Mauve Powder");
fabric_mix_satin_silk_crepe.prints.create(:name => "print_mix_jewelry_pearl_grey", :presentation => "Jewelry Pearl Grey");

fabric_mix_satin_silk_ltd = @site.fabrics.create(:name => "fabric_mix_satin_silk_ltd", :presentation => "Mix Satin Silk");
fabric_mix_satin_silk_ltd.prints.create(:name => "mix_1_silk", :presentation => "Mix 1 Mosaïc pink/Gold/Japanese pink");
fabric_mix_satin_silk_ltd.prints.create(:name => "mix_2_silk", :presentation => "Mix 2 Steel orange/Celest beige/Patch blue");
fabric_mix_satin_silk_ltd.prints.create(:name => "mix_3_silk", :presentation => "Mix 3 Antik design/lucknow brown/floral green");
fabric_mix_satin_silk_ltd.prints.create(:name => "mix_5_silk", :presentation => "Mix 5 Arabesque taupe/Art deco blue/Mosaïc blue");
fabric_mix_satin_silk_ltd.prints.create(:name => "mix_6_silk", :presentation => "Mix 6 Iris lilac/Pink Pastel/Art deco lilac");

#-------

tunic_ivana = @catalog.products.create(
  :title => "Tunic Ivana", 
  :sizes => "XS,S,M,L"
)

tunic_ivana.image_assignments.create(:image => create_image("tunic_ivana"))
tunic_ivana.print_assignments.create(:fabric => fabric_eyelet_cotton)
tunic_ivana.categorizations.create(:category => new_product_category)
tunic_ivana.categorizations.create(:category => tunic_shape_category)

#-------

dress_leti = @catalog.products.create(
  :title => "Dress Leti", 
  :sizes => "S,M,L"
)

dress_leti.image_assignments.create(:image => create_image("dress_leti"))
dress_leti.print_assignments.create(:fabric => fabric_eyelet_cotton, :price => 120)
dress_leti.print_assignments.create(:fabric => fabric_hakoba_cotton, :price => 115)
dress_leti.print_assignments.create(:fabric => fabric_satin_silk, :price => 135)
dress_leti.categorizations.create(:category => new_product_category)
dress_leti.categorizations.create(:category => dress_shape_category)

#-------

top_magnolia = @catalog.products.create(
  :title => "Top Magnolia", 
  :sizes => "S,M/L"
)

top_magnolia.image_assignments.create(:image => create_image("top_magnolia"))
top_magnolia.print_assignments.create(:fabric => fabric_cotton_lurex, :price => 75)
top_magnolia.print_assignments.create(:fabric => fabric_crepe_chiffon, :price => 130)
top_magnolia.print_assignments.create(:fabric => fabric_lace, :price => 235)
top_magnolia.categorizations.create(:category => new_product_category)
top_magnolia.categorizations.create(:category => top_shape_category)

#-------

dress_rania = @catalog.products.create(
  :title => "Dress Rania", 
  :sizes => "S,M,L"
)

dress_rania.image_assignments.create(:image => create_image("dress_rania"))
dress_rania.print_assignments.create(:fabric => fabric_cotton_lurex, :price => 95)
dress_rania.categorizations.create(:category => new_product_category)
dress_rania.categorizations.create(:category => dress_shape_category)


#-------

bikini_maya = @catalog.products.create(
  :title => "Bikini Maya", 
  :sizes => "S,M,L"
)

bikini_maya.image_assignments.create(:image => create_image("bikini_maya"))
bikini_maya.print_assignments.create(:fabric => fabric_cotton_lurex, :price => 75)
bikini_maya.categorizations.create(:category => new_product_category)
bikini_maya.categorizations.create(:category => bikini_shape_category)

#-------

top_agatha = @catalog.products.create(
  :title => "Top Agatha", 
  :sizes => "S,M,L"
)

top_agatha.image_assignments.create(:image => create_image("top_agatha"))
top_agatha.print_assignments.create(:fabric => fabric_cotton_lurex, :price => 80)
top_agatha.categorizations.create(:category => new_product_category)
top_agatha.categorizations.create(:category => top_shape_category)

#-------

dress_gardenia = @catalog.products.create(
  :title => "Dress Gardenia", 
  :sizes => "S,M,L"
)

dress_gardenia.image_assignments.create(:image => create_image("dress_gardenia"))
dress_gardenia.print_assignments.create(:fabric => fabric_cotton_lurex, :price => 80)
dress_gardenia.categorizations.create(:category => new_product_category)
dress_gardenia.categorizations.create(:category => dress_shape_category)

#-------

dress_darice = @catalog.products.create(
  :title => "Dress Darice", 
  :sizes => "XS,S,M,L"
)

dress_darice.image_assignments.create(:image => create_image("dress_darice"))
dress_darice.print_assignments.create(:fabric => fabric_crochet, :price => 190)
dress_darice.print_assignments.create(:fabric => fabric_eyelet_cotton, :price => 135)
dress_darice.print_assignments.create(:fabric => fabric_lace, :price => 165)
dress_darice.categorizations.create(:category => new_product_category)
dress_darice.categorizations.create(:category => dress_shape_category)

#-------

short_lana = @catalog.products.create(
  :title => "Short Lana", 
  :sizes => "S,M,L"
)

short_lana.image_assignments.create(:image => create_image("short_lana"))
short_lana.print_assignments.create(:fabric => fabric_lace, :price => 125)
short_lana.categorizations.create(:category => best_product_category)
short_lana.categorizations.create(:category => pant_shape_category)

#-------

top_petula = @catalog.products.create(
  :title => "Top Petula", 
  :sizes => "S,M,L"
)

top_petula.image_assignments.create(:image => create_image("top_petula"))
top_petula.print_assignments.create(:fabric => fabric_cotton_lurex, :price => 75)
top_petula.categorizations.create(:category => new_product_category)
top_petula.categorizations.create(:category => top_shape_category)

#-------

top_bianca = @catalog.products.create(
  :title => "Top Bianca", 
  :sizes => "S,M,L"
)

top_bianca.image_assignments.create(:image => create_image("top_bianca"))
top_bianca.print_assignments.create(:fabric => fabric_lucknow, :price => 185)
top_bianca.categorizations.create(:category => new_product_category)
top_bianca.categorizations.create(:category => top_shape_category)

#-------

dress_alycia = @catalog.products.create(
  :title => "Dress Alycia", 
  :sizes => "S,M,L"
)

dress_alycia.image_assignments.create(:image => create_image("dress_alycia"))
dress_alycia.print_assignments.create(:fabric => fabric_satin_silk, :price => 135)
dress_alycia.print_assignments.create(:fabric => fabric_cotton_lurex, :price => 95)
dress_alycia.print_assignments.create(:fabric => fabric_eyelet_cotton, :price => 115)
dress_alycia.categorizations.create(:category => new_product_category)
dress_alycia.categorizations.create(:category => dress_shape_category)

#-------

dress_noa = @catalog.products.create(
  :title => "Dress Noa", 
  :sizes => "S,M,L"
)

dress_noa.image_assignments.create(:image => create_image("dress_noa"))
dress_noa.print_assignments.create(:fabric => fabric_satin_silk, :price => 155)
dress_noa.categorizations.create(:category => new_product_category)
dress_noa.categorizations.create(:category => dress_shape_category)

#-------

dress_adriana = @catalog.products.create(
  :title => "Dress Adriana", 
  :sizes => "S,M,L"
)

dress_adriana.image_assignments.create(:image => create_image("dress_adriana"))
dress_adriana.print_assignments.create(:fabric => fabric_satin_silk, :price => 135)
dress_adriana.print_assignments.create(:fabric => fabric_cotton_lurex, :price => 85)
dress_adriana.categorizations.create(:category => new_product_category)
dress_adriana.categorizations.create(:category => dress_shape_category)

#-------

dress_mathilda = @catalog.products.create(
  :title => "Dress Mathilda", 
  :sizes => "S,M,L"
)

dress_mathilda.image_assignments.create(:image => create_image("dress_mathilda"))
dress_mathilda.print_assignments.create(:fabric => fabric_crepe_chiffon, :price => 125)
dress_mathilda.print_assignments.create(:fabric => fabric_lucknow, :price => 215)
dress_mathilda.categorizations.create(:category => new_product_category)
dress_mathilda.categorizations.create(:category => dress_shape_category)

#-------

dress_brenda = @catalog.products.create(
  :title => "Dress Brenda", 
  :sizes => "S,M,L"
)

dress_brenda.image_assignments.create(:image => create_image("dress_brenda"))
dress_brenda.print_assignments.create(:fabric => fabric_crepe_chiffon, :price => 150)
dress_brenda.categorizations.create(:category => new_product_category)
dress_brenda.categorizations.create(:category => dress_shape_category)

#-------

cover_mia = @catalog.products.create(
  :title => "Cover Mia", 
  :sizes => "One Size"
)

cover_mia.image_assignments.create(:image => create_image("cover_mia"))
cover_mia.print_assignments.create(:fabric => fabric_satin_silk, :price => 165)
cover_mia.categorizations.create(:category => new_product_category)
cover_mia.categorizations.create(:category => poncho_shape_category)

#-------

dress_sasha = @catalog.products.create(
  :title => "Dress Sasha", 
  :sizes => "S,M,L"
)

dress_sasha.image_assignments.create(:image => create_image("dress_sasha"))
dress_sasha.print_assignments.create(:fabric => fabric_mix_satin_silk_crepe, :price => 210)
dress_sasha.categorizations.create(:category => new_product_category)
dress_sasha.categorizations.create(:category => dress_shape_category)

#-------

top_bruna = @catalog.products.create(
  :title => "Top Bruna", 
  :sizes => "S,M,L"
)

top_bruna.image_assignments.create(:image => create_image("top_bruna"))
top_bruna.print_assignments.create(:fabric => fabric_satin_silk, :price => 150)
top_bruna.categorizations.create(:category => new_product_category)
top_bruna.categorizations.create(:category => top_shape_category)

#-------

top_amanda = @catalog.products.create(
  :title => "Top Amanda", 
  :sizes => "S,M,L"
)

top_amanda.image_assignments.create(:image => create_image("top_amanda"))
top_amanda.print_assignments.create(:fabric => fabric_mix_satin_silk_crepe, :price => 150)
top_amanda.categorizations.create(:category => new_product_category)
top_amanda.categorizations.create(:category => top_shape_category)

#-------

top_rosita = @catalog.products.create(
  :title => "Top Rosita", 
  :sizes => "One Size"
)

top_rosita.image_assignments.create(:image => create_image("top_rosita"))
top_rosita.print_assignments.create(:fabric => fabric_mix_satin_silk_crepe, :price => 115)
top_rosita.categorizations.create(:category => new_product_category)
top_rosita.categorizations.create(:category => combi_shape_category)

#-------

combi_luisa = @catalog.products.create(
  :title => "Combi Luisa", 
  :sizes => "S,M,L"
)

combi_luisa.image_assignments.create(:image => create_image("combi_luisa"))
combi_luisa.print_assignments.create(:fabric => fabric_satin_silk, :price => 115)
combi_luisa.print_assignments.create(:fabric => fabric_cotton_lurex, :price => 75)
combi_luisa.categorizations.create(:category => best_product_category)
combi_luisa.categorizations.create(:category => pant_shape_category)

#-------

skirt_deva = @catalog.products.create(
  :title => "Skirt Deva", 
  :sizes => "S,M,L"
)

skirt_deva.image_assignments.create(:image => create_image("skirt_deva"))
skirt_deva.print_assignments.create(:fabric => fabric_satin_silk, :price => 115)
skirt_deva.categorizations.create(:category => new_product_category)
skirt_deva.categorizations.create(:category => skirt_shape_category)

#-------

pant_churidar = @catalog.products.create(
  :title => "Pant Churidar", 
  :sizes => "S,M,L"
)

pant_churidar.image_assignments.create(:image => create_image("pant_churidar"))
pant_churidar.print_assignments.create(:fabric => fabric_satin_silk, :price => 110)
pant_churidar.print_assignments.create(:fabric => fabric_eyelet_cotton, :price => 95)
pant_churidar.categorizations.create(:category => new_product_category)
pant_churidar.categorizations.create(:category => pant_shape_category)

#-------

kimono_fabiana = @catalog.products.create(
  :title => "Kimono Fabiana", 
  :sizes => "One Size"
)

kimono_fabiana.image_assignments.create(:image => create_image("kimono_fabiana"))
kimono_fabiana.print_assignments.create(:fabric => fabric_satin_silk, :price => 165)
kimono_fabiana.print_assignments.create(:fabric => fabric_cotton_lurex, :price => 95)
kimono_fabiana.print_assignments.create(:fabric => fabric_eyelet_cotton, :price => 135)
kimono_fabiana.print_assignments.create(:fabric => fabric_crepe_chiffon, :price => 155)
kimono_fabiana.print_assignments.create(:fabric => fabric_lace, :price => 270)
kimono_fabiana.categorizations.create(:category => best_product_category)
kimono_fabiana.categorizations.create(:category => kimono_shape_category)

#-------

dress_camelia = @catalog.products.create(
  :title => "Dress Camelia", 
  :sizes => "One Size"
)

dress_camelia.image_assignments.create(:image => create_image("dress_camelia"))
dress_camelia.print_assignments.create(:fabric => fabric_cotton_lurex, :price => 95)
dress_camelia.print_assignments.create(:fabric => fabric_eyelet_cotton, :price => 130)
dress_camelia.print_assignments.create(:fabric => fabric_hakoba_cotton, :price => 120)
dress_camelia.categorizations.create(:category => best_product_category)
dress_camelia.categorizations.create(:category => dress_shape_category)

#-------

tunic_ciriana = @catalog.products.create(
  :title => "Tunic Ciriana", 
  :sizes => "S,M,L"
)

tunic_ciriana.image_assignments.create(:image => create_image("tunic_ciriana"))
tunic_ciriana.print_assignments.create(:fabric => fabric_satin_silk, :price => 145)
tunic_ciriana.print_assignments.create(:fabric => fabric_cotton_lurex, :price => 90)
tunic_ciriana.print_assignments.create(:fabric => fabric_hakoba_cotton, :price => 120)
tunic_ciriana.print_assignments.create(:fabric => fabric_eyelet_cotton, :price => 140)
tunic_ciriana.print_assignments.create(:fabric => fabric_lucknow, :price => 185)
tunic_ciriana.categorizations.create(:category => best_product_category)
tunic_ciriana.categorizations.create(:category => tunic_shape_category)

#-------

dress_manuela = @catalog.products.create(
  :title => "Dress Manuela", 
  :sizes => "S,M,L"
)

dress_manuela.image_assignments.create(:image => create_image("dress_manuela"))
dress_manuela.print_assignments.create(:fabric => fabric_cotton_lurex, :price => 135)
dress_manuela.categorizations.create(:category => best_product_category)
dress_manuela.categorizations.create(:category => dress_shape_category)

#-------

tunic_julia = @catalog.products.create(
  :title => "Tunic Julia", 
  :sizes => "S,M,L"
)

tunic_julia.image_assignments.create(:image => create_image("tunic_julia"))
tunic_julia.print_assignments.create(:fabric => fabric_satin_silk, :price => 165)
tunic_julia.categorizations.create(:category => best_product_category)
tunic_julia.categorizations.create(:category => tunic_shape_category)


#-------

poncho_doraline = @catalog.products.create(
  :title => "Poncho Doraline", 
  :sizes => "One Size"
)

poncho_doraline.image_assignments.create(:image => create_image("short_lana"))
poncho_doraline.print_assignments.create(:fabric => fabric_satin_silk, :price => 155)
poncho_doraline.print_assignments.create(:fabric => fabric_cotton_lurex, :price => 85)
poncho_doraline.print_assignments.create(:fabric => fabric_crochet, :price => 230)
poncho_doraline.categorizations.create(:category => best_product_category)
poncho_doraline.categorizations.create(:category => poncho_shape_category)

#-------

poncho_betina = @catalog.products.create(
  :title => "Poncho Betina", 
  :sizes => "S,M,L"
)

poncho_betina.image_assignments.create(:image => create_image("poncho_betina"))
poncho_betina.print_assignments.create(:fabric => fabric_satin_silk, :price => 165)
poncho_betina.categorizations.create(:category => best_product_category)
poncho_betina.categorizations.create(:category => poncho_shape_category)

#-------

dress_paloma = @catalog.products.create(
  :title => "Dress Paloma", 
  :sizes => "S,M,L"
)

dress_paloma.image_assignments.create(:image => create_image("dress_paloma"))
dress_paloma.print_assignments.create(:fabric => fabric_satin_silk, :price => 145)
dress_paloma.print_assignments.create(:fabric => fabric_eyelet_cotton, :price => 125)
dress_paloma.print_assignments.create(:fabric => fabric_cotton_lurex, :price => 85)
dress_paloma.print_assignments.create(:fabric => fabric_lace, :price => 185)
dress_paloma.categorizations.create(:category => best_product_category)
dress_paloma.categorizations.create(:category => dress_shape_category)

#-------

pant_marni = @catalog.products.create(
  :title => "Pant Marni", 
  :sizes => "S,M,L"
)

pant_marni.image_assignments.create(:image => create_image("pant_marni"))
pant_marni.print_assignments.create(:fabric => fabric_lace, :price => 190)
pant_marni.categorizations.create(:category => best_product_category)
pant_marni.categorizations.create(:category => pant_shape_category)

#-------

gilet_gypsy = @catalog.products.create(
  :title => "Gilet Gypsy", 
  :sizes => "S/M,L"
)

gilet_gypsy.image_assignments.create(:image => create_image("gilet_gypsy"))
gilet_gypsy.print_assignments.create(:fabric => fabric_lace, :price => 105)
gilet_gypsy.categorizations.create(:category => best_product_category)
gilet_gypsy.categorizations.create(:category => top_shape_category)

#-------

sarouel = @catalog.products.create(
  :title => "Sarouel", 
  :sizes => "One Size"
)

sarouel.image_assignments.create(:image => create_image("sarouel"))
sarouel.print_assignments.create(:fabric => fabric_crepe_chiffon, :price => 125)
sarouel.print_assignments.create(:fabric => fabric_cotton_lurex, :price => 85)
sarouel.categorizations.create(:category => best_product_category)
sarouel.categorizations.create(:category => pant_shape_category)




