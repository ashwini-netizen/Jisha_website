// Mobile Navigation Toggle
(function() {
    function initMobileMenu() {
        const mobileToggle = document.querySelector('.mobile-toggle');
        const navMenu = document.querySelector('.nav-menu');

        if (mobileToggle && navMenu) {
            mobileToggle.addEventListener('click', function() {
                navMenu.classList.toggle('active');
                
                // Toggle icon between bars and times
                const icon = mobileToggle.querySelector('i');
                if (icon) {
                    if (navMenu.classList.contains('active')) {
                        icon.classList.remove('fa-bars');
                        icon.classList.add('fa-times');
                    } else {
                        icon.classList.remove('fa-times');
                        icon.classList.add('fa-bars');
                    }
                }
            });
        }

        // Smooth Scrolling for anchor links
        document.querySelectorAll('a[href^="#"]').forEach(anchor => {
            anchor.addEventListener('click', function (e) {
                const href = this.getAttribute('href');
                if(href === '#') return;
                
                const target = document.querySelector(href);
                if (target) {
                    e.preventDefault();
                    target.scrollIntoView({
                        behavior: 'smooth'
                    });
                    
                    // Close mobile menu if open
                    if (navMenu && navMenu.classList.contains('active')) {
                        navMenu.classList.remove('active');
                        if (mobileToggle) {
                            const icon = mobileToggle.querySelector('i');
                            if (icon) {
                                icon.classList.remove('fa-times');
                                icon.classList.add('fa-bars');
                            }
                        }
                    }
                }
            });
        });

        // Reveal animations on scroll
        const revealCallback = function(entries, observer) {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    entry.target.classList.add('active');
                    observer.unobserve(entry.target);
                }
            });
        };
        const revealElements = document.querySelectorAll('.reveal');
        if (revealElements.length > 0) {
            const revealObserver = new IntersectionObserver(revealCallback, {
                threshold: 0.1,
                rootMargin: '0px 0px -50px 0px'
            });
            revealElements.forEach(el => {
                revealObserver.observe(el);
            });
        }
    }

    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', initMobileMenu);
    } else {
        initMobileMenu();
    }
})();
