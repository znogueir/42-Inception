define( 'DB_NAME', 'db_inception' );

define( 'DB_USER', 'db_user' );

define( 'DB_PASSWORD', 'db_password' );

define( 'DB_HOST', 'mariadb:3306' );

define( 'DB_CHARSET', 'utf8' );

define( 'DB_COLLATE', '' );

define( 'AUTH_KEY',          'Cmf4wkA2$$KsGAgQK$I4wVZG[GUt[kI+ZnbuNGk8{#eH&7I[Hn&ZDsa{&w4&l*]Y' );
define( 'SECURE_AUTH_KEY',   '+S.=sPg6K/;VM+R{Thnsp;]x:#^7z5jn$ GVy~!vATLZ#+rhPJcu8cv>JXLQ.q`5' );
define( 'LOGGED_IN_KEY',     '?WKNO6j/dtR!e.lzeRnaCn;^flARAP$1DW`.aC(^/(3!:USy=3eACOpe30![~8gB' );
define( 'NONCE_KEY',         '`6Jp0nk9d-{ExXA#?OH{:jY9Or|/W#|{q@!)wjeT4KfeqF J<83rY8xvk%/Olrh*' );
define( 'AUTH_SALT',         '0Ri:y`1=S1FV(!laOvG52Rf}4Pi.?D7EArXNiN-%|V/[O0:io{uA[yVRE83X1$HB' );
define( 'SECURE_AUTH_SALT',  'pjAFBgrj0D7L`p2ScN:r70o~.>`o-;ru,^`1*A0fc~R2-Mi8WQhR0(T/XKkn^}>M' );
define( 'LOGGED_IN_SALT',    'z9Lmyf8ZVVy.s[kX^1Df~KO]pX!HJ(NXXH>zN4c)l0d|ZzVX/)?r;.&COqA?%XDl' );
define( 'NONCE_SALT',        'oG$ng}+u{d5(`Bz9mik<:]zWzVLm j8FvcKvs6TK*E>C`<Q9HlTo]V;F3CcC;>1t' );
define( 'WP_CACHE_KEY_SALT', 'Ew;e<YMJ<gm^5N]Ixe>P}dVQmnH787A8}J#GMSzXvS`BGCaZl09.8tG_=1SWw6CN' );

$table_prefix = 'wp_';

define('WP_REDIS_HOST', 'redis');
define('WP_REDIS_PORT', '6379');
define('WP_CACHE_KEY_SALT', 'znogueir.42.fr');

if ( ! defined( 'WP_DEBUG' ) ) {
	define( 'WP_DEBUG', false );
}

if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

require_once ABSPATH . 'wp-settings.php';