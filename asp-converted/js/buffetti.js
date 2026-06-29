document.addEventListener('DOMContentLoaded', function() {
    var menuBtn = document.getElementById('bfMobileMenuBtn');
    var nav = document.getElementById('bfMobileNav');
    var overlay = document.getElementById('bfMobileOverlay');
    var closeBtn = document.getElementById('bfMobileNavClose');
    var cartBtn = document.getElementById('bfCartBtn');
    var cartModal = document.getElementById('bfCartModal');
    var cartOverlay = document.getElementById('bfCartModalOverlay');
    var cartClose = document.getElementById('bfCartModalClose');
    var cartContinue = document.getElementById('bfCartContinue');
    var scrollTopBtn = document.getElementById('bfScrollTop');

    function openMobileMenu() {
        if (nav) nav.classList.add('active');
        if (overlay) overlay.classList.add('active');
        document.body.style.overflow = 'hidden';
    }

    function closeMobileMenu() {
        if (nav) nav.classList.remove('active');
        if (overlay) overlay.classList.remove('active');
        document.body.style.overflow = '';
    }

    function openCartModal() {
        if (cartModal) cartModal.classList.add('active');
        document.body.style.overflow = 'hidden';
    }

    function closeCartModal() {
        if (cartModal) cartModal.classList.remove('active');
        document.body.style.overflow = '';
    }

    if (menuBtn) menuBtn.addEventListener('click', openMobileMenu);
    if (closeBtn) closeBtn.addEventListener('click', closeMobileMenu);
    if (overlay) overlay.addEventListener('click', closeMobileMenu);

    if (cartBtn) cartBtn.addEventListener('click', openCartModal);
    if (cartOverlay) cartOverlay.addEventListener('click', closeCartModal);
    if (cartClose) cartClose.addEventListener('click', closeCartModal);
    if (cartContinue) cartContinue.addEventListener('click', closeCartModal);

    window.addEventListener('scroll', function() {
        if (scrollTopBtn) {
            if (window.pageYOffset > 300) {
                scrollTopBtn.classList.add('visible');
            } else {
                scrollTopBtn.classList.remove('visible');
            }
        }
    });

    if (scrollTopBtn) {
        scrollTopBtn.addEventListener('click', function() {
            window.scrollTo({ top: 0, behavior: 'smooth' });
        });
    }
});
