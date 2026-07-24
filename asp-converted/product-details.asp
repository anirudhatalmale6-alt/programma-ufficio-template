<!--#include file="connessionesql.inc"-->
<!--#include file="parametriasp.inc"-->
<!--#include file="parametriasplettura.inc" -->
<%
'dettagli od
Set tbprodcatalogo = Server.CreateObject("ADODB.RecordSet")
Set tbprodcatalogogen = Server.CreateObject("ADODB.RecordSet")
sSql="select * from prodotti where codice_od='" & Trim(Request("cod")) & "' limit 1"
tbprodcatalogo.Open sSql, connm
if tbprodcatalogo.eof then response.redirect "articolonontrovato.asp"
sSql="select * from prodotti where codice_od='" & Trim(Request("cod")) & "' limit 1"
tbprodcatalogogen.Open sSql, conn
if tbprodcatalogogen.eof then
    datitecnici=tbprodcatalogo("descrizione1")
   else
    datitecnici=tbprodcatalogogen("descrizione1")
end if
%>
<!DOCTYPE html>
<html lang="en">
  <head>
<!--#include file="head.inc" -->
  </head>
  <body>


<!--#include file="top.inc" -->

 <br>

    <section class="bf-content-page">
      <div class="bf-container">
        <div class="bf-product-detail-grid">
          <div class="bf-product-gallery">
            <div class="bf-product-gallery-main">
              <div class="swiper swiper-product">
                <div class="swiper-wrapper">
                    <figure class="swiper-slide">
                     <img src='foto.asp?cat=catalogoisp&img=<%=tbprodcatalogo("codice_od")%>.jpg' border=0>

                    </figure>
                    <figure class="swiper-slide">
                      <img src='foto.asp?cat=catalogoisp/piccole&img=<%=tbprodcatalogo("codice_od")%>.jpg' border=0>
                    </figure>
                    <figure class="swiper-slide">

                    </figure>
                    <figure class="swiper-slide">

                    </figure>
                </div>
                <div class="button-prev">
                  <i class="fa-solid fa-chevron-left"></i>
                </div>
                <div class="button-next">
                  <i class="fa-solid fa-chevron-right"></i>
                </div>
              </div>
            </div>
            <div class="bf-product-gallery-thumbs">
              <div class="swiper swiper-thumbs">
                <div class="swiper-wrapper">
                    <figure class="swiper-slide">
                      <img src='foto.asp?cat=catalogoisp/piccole&img=<%=tbprodcatalogo("codice_od")%>.jpg' border=0>
                    </figure>
                    <figure class="swiper-slide">

                    </figure>
                    <figure class="swiper-slide">

                    </figure>
                    <figure class="swiper-slide">

                    </figure>
                </div>
              </div>
            </div>
          </div>

          <div class="bf-product-detail-info">
            <div class="bf-product-detail-rating">
              <div class="rater my-2" data-rater="5"></div>
              <small>(2)</small>
            </div>
            <div class="bf-product-detail-stock">
              <span>In Stock</span>
            </div>
            <h2>
              Amazon Echo Dot 5th Gen - Deep sea blue
            </h2>
            <div class="bf-product-detail-price">
              <span class="bf-price-current">$67.48</span>
              <span class="bf-price-old"><del>$89.98</del></span>
              <span class="bf-price-discount-badge">-25% off</span>
            </div>
            <div class="bf-product-description">
              <p>
                Introducing Amazon Echo Dot 5th Gen in a stylish deep sea blue
                color, the perfect smart speaker for your home. With its 15 W of
                power you will enjoy clear, high-quality sound in any environment.
                Thanks to the virtual assistant Alexa you can control your music,
                home devices and obtain useful information just with your voice.
                In addition, its touch control function gives you a more
                comfortable and intuitive user experience.
              </p>
            </div>

            <form>
              <div class="bf-product-variant">
                <span>Size:</span>
                <ul class="bf-variant-list">
                  <li>
                    <input type="radio" value="" name="size" id="size1" checked="" />
                    <label for="size1">S</label>
                  </li>
                  <li>
                    <input type="radio" value="" name="size" id="size2" />
                    <label for="size2">M</label>
                  </li>
                  <li>
                    <input type="radio" value="" name="size" id="size3" />
                    <label for="size3">L</label>
                  </li>
                  <li>
                    <input type="radio" value="" name="size" id="size4" />
                    <label for="size4">XL</label>
                  </li>
                </ul>
              </div>
              <div class="bf-product-variant">
                <span>Colors:</span>
                <ul class="bf-variant-list bf-variant-colors">
                  <li>
                    <input type="radio" value="" name="color" id="color2" />
                    <label for="color2">
                      <span class="bf-variant-swatch">
                        <img src="./img/product/color2.png" alt="" />
                      </span>
                      <span>Charcoal</span>
                    </label>
                  </li>
                  <li>
                    <input type="radio" value="" name="color" id="color1" checked="" />
                    <label for="color1">
                      <span class="bf-variant-swatch">
                        <img src="./img/product/color1.png" alt="" />
                      </span>
                      <span>Deep sea blue</span>
                    </label>
                  </li>
                  <li>
                    <input type="radio" value="" name="color" id="color3" />
                    <label for="color3">
                      <span class="bf-variant-swatch">
                        <img src="./img/product/color3.png" alt="" />
                      </span>
                      <span>Glacier White</span>
                    </label>
                  </li>
                </ul>
              </div>
              <div class="bf-quantity-row">
                <span>Quantity:</span>
                <div>
                  <div class="bf-quantity-input">
                    <input type="button" class="minus" value="-">
                    <input type="number" name="quantity" title="Qty" value="1" min="1" step="1">
                    <input type="button" class="plus" value="+">
                  </div>
                  <button class="bf-btn-cart" type="submit">
                    <i class="fa-solid fa-cart-shopping"></i>
                    Add to cart
                  </button>
                </div>
              </div>
            </form>

            <div class="bf-btn-wishlist">
              <button class="btn-wishlist">
                <i class="fa-regular fa-heart"></i>
                <span>Add to wishlist</span>
              </button>
            </div>

            <div class="bf-product-detail-meta">
              <div>
                <span>Available:</span>
                <span>20 items in Stock</span>
              </div>
              <div>
                <span>Category:</span>
                <a href="#">
                  Virtual Assistants
                </a>
              </div>
              <div>
                <span>Tags:</span>
                <a href="#">Audio,</a>
                <a href="#">Virtual Assistants</a>
              </div>
            </div>
            <div class="bf-product-share">
              <span>Share:</span>
              <div>
                <a href="#">
                  <i class="fa-brands fa-facebook"></i>
                </a>
                <a href="#">
                  <i class="fa-brands fa-x-twitter"></i>
                </a>
                <a href="#">
                  <i class="fa-brands fa-whatsapp"></i>
                </a>
                <a href="#">
                  <i class="fa-solid fa-link"></i>
                </a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <section class="bf-content-page">
      <div class="bf-container">
        <div class="bf-product-tabs">
          <ul class="bf-product-tabs-nav">
            <li class="active">
              Description
            </li>
            <li>
              Additional Info
            </li>
          </ul>
          <div class="bf-product-tabs-content">
            <div class="tab-content-item active">
              <div class="expandable-container">
                <div class="expandable-content">
                  <div class="expandable-subcontent">
                    <p>
                      Introducing the Amazon Echo Dot 5th Gen in a sleek deep sea
                      blue color, the perfect smart speaker for your home. With
                      its 15W power, you'll enjoy crisp, high-quality sound in any
                      environment. Thanks to the virtual assistant Alexa, you can
                      control your music, home devices, and get useful information
                      with just your voice. Additionally, its touch control
                      feature provides a more comfortable and intuitive user
                      experience.
                    </p>
                    <p>
                      The Echo Dot 5th Gen is compatible with iOS 14, Android 8.0,
                      and Fire OS 7.0, allowing you to easily connect it to your
                      mobile devices. Its Wi-Fi connection ensures a smooth and
                      uninterrupted experience, while the Bluetooth feature allows
                      you to pair it with other compatible devices.
                    </p>
                    <figure>
                      <img src="./img/product/product-wallpaper.png" alt="" />
                    </figure>
                    <p>
                      Enjoy the ability to create a multi-room audio system in
                      your home by connecting multiple Echo Dot 5th Gen devices,
                      allowing music to accompany you in every corner. Although
                      not moisture-resistant, this smart speaker is perfect for
                      any indoor space, providing you with an unmatched sound and
                      control experience. Don't wait any longer to take your home
                      to the next level with the Amazon Echo Dot 5th Gen.
                    </p>
                  </div>
                </div>
                <button class="expandable-toggle" type="button">
                  <i class="fa-solid fa-chevron-down"></i>
                </button>
              </div>
            </div>
            <div class="tab-content-item">
              <div class="expandable-container">
                <div class="expandable-content">
                  <div class="expandable-subcontent">
                    <div class="bf-specs-grid">
                      <div class="bf-specs-col">
                        <h3>General characteristics</h3>
                        <table class="bf-specs-table">
                          <tr>
                            <th>Brand</th>
                            <td>Amazon</td>
                          </tr>
                          <tr>
                            <th>Model</th>
                            <td>Echo Dot 5th Gen</td>
                          </tr>
                          <tr>
                            <th>Color</th>
                            <td>Deep sea blue</td>
                          </tr>
                          <tr>
                            <th>Voltage</th>
                            <td>110V/240V</td>
                          </tr>
                        </table>
                      </div>
                      <div class="bf-specs-col">
                        <h3>Sound</h3>
                        <table class="bf-specs-table">
                          <tr>
                            <th>Power</th>
                            <td>15 W</td>
                          </tr>
                          <tr>
                            <th>Radio frequencies</th>
                            <td>2.4 GHz, 5 GHz</td>
                          </tr>
                          <tr>
                            <th>With multi-room audio system</th>
                            <td>Yes</td>
                          </tr>
                          <tr>
                            <th>Minimum frequency response</th>
                            <td>100 Hz</td>
                          </tr>
                          <tr>
                            <th>Maximum frequency response</th>
                            <td>40000 Hz</td>
                          </tr>
                        </table>
                      </div>
                      <div class="bf-specs-col">
                        <h3>Specifications</h3>
                        <table class="bf-specs-table">
                          <tr>
                            <th>Virtual assistants</th>
                            <td>Alexa</td>
                          </tr>
                          <tr>
                            <th>Features</th>
                            <td>
                              Music playback, Voice control, Environmental
                              sensors, Home device control, Touch control
                            </td>
                          </tr>
                          <tr>
                            <th>Languages</th>
                            <td>Spanish, English</td>
                          </tr>
                          <tr>
                            <th>Supported operating systems</th>
                            <td>iOS 14, Android 8.0, Fire OS 7.0</td>
                          </tr>
                        </table>
                      </div>
                    </div>
                  </div>
                </div>
                <button class="expandable-toggle" type="button">
                  <i class="fa-solid fa-chevron-down"></i>
                </button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <section class="bf-similar-section">
      <div class="bf-container">
        <div class="swiper swiper-cards">
          <h2 class="bf-section-title">
            Related Products
          </h2>
          <div class="bf-products-grid">

            <div class="bf-product-card">
              <span class="bf-product-badge">New</span>
              <div class="bf-product-image">
                <a href="#"><img src="./img/products/product-9.jpg" alt="img" /></a>
              </div>
              <div class="bf-product-actions">
                <button class="bf-btn-wishlist" type="button"><i class="fa-regular fa-heart"></i></button>
                <button class="bf-btn-quickview" type="button"><i class="fa-solid fa-eye"></i></button>
              </div>
              <div class="bf-product-info">
                <div class="rater my-2" data-rater="5"></div>
                <div class="bf-product-name">
                  <a href="#">Moto E6s Special Edition 64 GB 4 GB RAM</a>
                </div>
                <div class="bf-product-price">
                  <span class="bf-price-current">$230.00</span>
                </div>
              </div>
              <div class="bf-product-footer">
                <a href="#" class="bf-btn-cart">View details</a>
              </div>
            </div>

            <div class="bf-product-card">
              <span class="bf-product-badge">-47%</span>
              <div class="bf-product-image">
                <a href="#"><img src="./img/products/product-3.jpg" alt="img" /></a>
              </div>
              <div class="bf-product-actions">
                <button class="bf-btn-wishlist" type="button"><i class="fa-regular fa-heart"></i></button>
                <button class="bf-btn-quickview" type="button"><i class="fa-solid fa-eye"></i></button>
              </div>
              <div class="bf-product-info">
                <div class="rater my-2" data-rater="3"></div>
                <div class="bf-product-name">
                  <a href="#">Logitech G733 Wireless Headphones</a>
                </div>
                <div class="bf-product-price">
                  <span class="bf-price-current">$120.00</span>
                  <span class="bf-price-old"><del>$230.00</del></span>
                </div>
              </div>
              <div class="bf-product-footer">
                <a href="#" class="bf-btn-cart">View details</a>
              </div>
            </div>

            <div class="bf-product-card">
              <span class="bf-product-badge">Out of stock</span>
              <div class="bf-product-image">
                <a href="#"><img src="./img/products/product-12.jpg" alt="img" /></a>
              </div>
              <div class="bf-product-actions">
                <button class="bf-btn-wishlist" type="button"><i class="fa-regular fa-heart"></i></button>
                <button class="bf-btn-quickview" type="button"><i class="fa-solid fa-eye"></i></button>
              </div>
              <div class="bf-product-info">
                <div class="rater my-2" data-rater="4"></div>
                <div class="bf-product-name">
                  <a href="#">Nikon D3500 W/AF-P DX NIKKOR 0.709-2.165 in f/3.5-5.6G VR</a>
                </div>
                <div class="bf-product-price">
                  <span class="bf-price-current">$230.00</span>
                </div>
              </div>
              <div class="bf-product-footer">
                <a href="#" class="bf-btn-cart">View details</a>
              </div>
            </div>

            <div class="bf-product-card">
              <div class="bf-product-image">
                <a href="#"><img src="./img/products/product-4.jpg" alt="img" /></a>
              </div>
              <div class="bf-product-actions">
                <button class="bf-btn-wishlist" type="button"><i class="fa-regular fa-heart"></i></button>
                <button class="bf-btn-quickview" type="button"><i class="fa-solid fa-eye"></i></button>
              </div>
              <div class="bf-product-info">
                <div class="rater my-2" data-rater="2"></div>
                <div class="bf-product-name">
                  <a href="#">Google Chromecast 3.ª gen GA00439</a>
                </div>
                <div class="bf-product-price">
                  <span class="bf-price-current">$230.00</span>
                </div>
              </div>
              <div class="bf-product-footer">
                <a href="#" class="bf-btn-cart">View details</a>
              </div>
            </div>

            <div class="bf-product-card">
              <div class="bf-product-image">
                <a href="#"><img src="./img/products/product-14.jpg" alt="img" /></a>
              </div>
              <div class="bf-product-actions">
                <button class="bf-btn-wishlist" type="button"><i class="fa-regular fa-heart"></i></button>
                <button class="bf-btn-quickview" type="button"><i class="fa-solid fa-eye"></i></button>
              </div>
              <div class="bf-product-info">
                <div class="rater my-2" data-rater="5"></div>
                <div class="bf-product-name">
                  <a href="#">PlayStation DualSense&reg; Wireless Controller</a>
                </div>
                <div class="bf-product-price">
                  <span class="bf-price-current">$230.00</span>
                </div>
              </div>
              <div class="bf-product-footer">
                <a href="#" class="bf-btn-cart">View details</a>
              </div>
            </div>

            <div class="bf-product-card">
              <span class="bf-product-badge">-47%</span>
              <div class="bf-product-image">
                <a href="#"><img src="./img/products/product-2.jpg" alt="img" /></a>
              </div>
              <div class="bf-product-actions">
                <button class="bf-btn-wishlist" type="button"><i class="fa-regular fa-heart"></i></button>
                <button class="bf-btn-quickview" type="button"><i class="fa-solid fa-eye"></i></button>
              </div>
              <div class="bf-product-info">
                <div class="rater my-2" data-rater="3"></div>
                <div class="bf-product-name">
                  <a href="#">Amazon Echo Dot 5th Gen</a>
                </div>
                <div class="bf-product-price">
                  <span class="bf-price-current">$120.00</span>
                  <span class="bf-price-old"><del>$230.00</del></span>
                </div>
              </div>
              <div class="bf-product-footer">
                <a href="#" class="bf-btn-cart">View details</a>
              </div>
            </div>

            <div class="bf-product-card">
              <span class="bf-product-badge">Out of stock</span>
              <div class="bf-product-image">
                <a href="#"><img src="./img/products/product-5.jpg" alt="img" /></a>
              </div>
              <div class="bf-product-actions">
                <button class="bf-btn-wishlist" type="button"><i class="fa-regular fa-heart"></i></button>
                <button class="bf-btn-quickview" type="button"><i class="fa-solid fa-eye"></i></button>
              </div>
              <div class="bf-product-info">
                <div class="rater my-2" data-rater="4"></div>
                <div class="bf-product-name">
                  <a href="#">Microphone HyperX QuadCast Multipattern</a>
                </div>
                <div class="bf-product-price">
                  <span class="bf-price-current">$230.00</span>
                </div>
              </div>
              <div class="bf-product-footer">
                <a href="#" class="bf-btn-cart">View details</a>
              </div>
            </div>

            <div class="bf-product-card">
              <span class="bf-product-badge">New</span>
              <div class="bf-product-image">
                <a href="#"><img src="./img/products/product-13.jpg" alt="img" /></a>
              </div>
              <div class="bf-product-actions">
                <button class="bf-btn-wishlist" type="button"><i class="fa-regular fa-heart"></i></button>
                <button class="bf-btn-quickview" type="button"><i class="fa-solid fa-eye"></i></button>
              </div>
              <div class="bf-product-info">
                <div class="rater my-2" data-rater="0"></div>
                <div class="bf-product-name">
                  <a href="#">Oculus Meta Quest 2 128 Gb Virtual Reality Glasses</a>
                </div>
                <div class="bf-product-price">
                  <span class="bf-price-current">$230.00</span>
                </div>
              </div>
              <div class="bf-product-footer">
                <a href="#" class="bf-btn-cart">View details</a>
              </div>
            </div>

          </div>
        </div>
      </div>
    </section>

    <section class="bf-content-page">
      <div class="bf-container">
        <h2 class="bf-section-title">
          Reviews (2)
        </h2>
        <div class="bf-reviews-grid">
          <div class="bf-reviews-main">
            <h2 class="bf-reviews-subtitle">
              Customer questions &amp; answers
            </h2>
            <div class="bf-reviews-list">
              <div class="bf-review-item">
                <figure class="bf-review-avatar">
                  <img src="./img/client/client1.jpg" alt="profile_logo" />
                </figure>
                <div class="bf-review-body">
                  <div class="bf-review-head">
                    <a href="#">Monica Stone</a>
                    &#183;
                    <span>15 Nov. 09:21pm</span>
                  </div>
                  <div class="rater my-2" data-rater="5"></div>
                  <p>
                    As an avid tech enthusiast, I've tried several smart speakers,
                    but the Amazon Echo Dot 5th Gen in Deep Sea Blue stands out.
                    Its sleek design adds a touch of elegance to any room, while
                    its powerful performance exceeds expectations. The deep sea
                    blue color is a refreshing change from standard options,
                    adding personality to my smart home setup. From controlling
                    smart devices to playing my favorite tunes with crisp clarity,
                    this Echo Dot delivers on all fronts. Highly recommended!
                  </p>
                  <div class="bf-review-actions">
                    <span><i class="fa-solid fa-reply"></i> Reply</span>
                    <span><i class="fa-solid fa-pen"></i> Edit</span>
                  </div>
                </div>
              </div>
              <div class="bf-review-item">
                <figure class="bf-review-avatar">
                  <img src="./img/client/client4.jpg" alt="profile_logo" />
                </figure>
                <div class="bf-review-body">
                  <div class="bf-review-head">
                    <a href="#">Alex Thompson</a>
                    &#183;
                    <span>14 Nov. 11:28am</span>
                  </div>
                  <div class="rater my-2" data-rater="4"></div>
                  <p>
                    I've been using the Amazon Echo Dot 5th Gen in Deep Sea Blue
                    for a few weeks now, and I'm thoroughly impressed. The color
                    is striking, adding a pop of personality to my home decor.
                    Setup was a breeze, and the device seamlessly integrates with
                    my smart home ecosystem. Whether I'm asking for weather
                    updates, setting reminders, or streaming music, the Echo Dot
                    handles everything with ease. The sound quality is
                    surprisingly robust for its size, filling my room with clear,
                    balanced audio. Overall, a fantastic addition to any smart
                    home setup.
                  </p>
                  <div class="bf-review-actions">
                    <span><i class="fa-solid fa-reply"></i> Reply</span>
                  </div>
                </div>
              </div>
            </div>
            <h2 class="bf-reviews-subtitle">
              Add a review
            </h2>
            <form class="bf-review-form">
              <div class="bf-review-rating">
                <span>Your Valoration:</span>
                <div id="rater"></div>
                <input name="ratingvalue" class="rating-value" type="number" value="" />
              </div>
              <div class="bf-review-field">
                <textarea id="review" placeholder=" " required></textarea>
                <label for="review">Review</label>
              </div>
              <button class="bf-btn-cart" type="submit">
                Post review
              </button>
            </form>
          </div>
          <div class="bf-reviews-side">
            <h2 class="bf-reviews-subtitle">
              Customer reviews
            </h2>
            <div class="bf-reviews-summary">
              <div class="bf-reviews-score">
                <span>5,0 / 5,0</span>
                <div class="rater my-2" data-rater="5"></div>
                <span><i class="bi bi-chat-quote"></i> 2 Reviews</span>
              </div>
              <div class="bf-reviews-bars">
                <div class="bf-review-bar">
                  <span>5</span>
                  <div class="bf-bar-track"><div class="bf-bar-fill" style="width:85%">85%</div></div>
                </div>
                <div class="bf-review-bar">
                  <span>4</span>
                  <div class="bf-bar-track"><div class="bf-bar-fill" style="width:65%">65%</div></div>
                </div>
                <div class="bf-review-bar">
                  <span>3</span>
                  <div class="bf-bar-track"><div class="bf-bar-fill" style="width:30%">30%</div></div>
                </div>
                <div class="bf-review-bar">
                  <span>2</span>
                  <div class="bf-bar-track"><div class="bf-bar-fill" style="width:45%">45%</div></div>
                </div>
                <div class="bf-review-bar">
                  <span>1</span>
                  <div class="bf-bar-track"><div class="bf-bar-fill" style="width:25%">25%</div></div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!--#include file="footer.inc" -->
<%tbprodcatalogo.close%>
  </body>
</html>
<!--#include file="sqlchiudi.inc"-->