<?php
/**
 * La configuration de base de votre installation WordPress.
 *
 * Ce fichier est utilisé par le script de création de wp-config.php pendant
 * le processus d’installation. Vous n’avez pas à utiliser le site web, vous
 * pouvez simplement renommer ce fichier en « wp-config.php » et remplir les
 * valeurs.
 *
 * Ce fichier contient les réglages de configuration suivants :
 *
 * Réglages MySQL
 * Préfixe de table
 * Clés secrètes
 * Langue utilisée
 * ABSPATH
 *
 * @link https://fr.wordpress.org/support/article/editing-wp-config-php/.
 *
 * @package WordPress
 */

// ** Réglages MySQL - Votre hébergeur doit vous fournir ces informations. ** //
/** Nom de la base de données de WordPress. */
define( 'DB_NAME', getenv('WORDPRESS_DB_NAME)'));

/** Utilisateur de la base de données MySQL. */
define( 'DB_USER', getenv('WORDPRESS_DB_USER)'));

/** Mot de passe de la base de données MySQL. */
define( 'DB_PASSWORD', getenv('WORDPRESS_DB_PASS)'));

/** Adresse de l’hébergement MySQL. */
define( 'DB_HOST', getenv('WORDPRESS_DB_HOST)'));

/** Jeu de caractères à utiliser par la base de données lors de la création des tables. */
define( 'DB_CHARSET', 'utf8' );

/**
 * Type de collation de la base de données.
 * N’y touchez que si vous savez ce que vous faites.
 */
define( 'DB_COLLATE', '' );


/**
 * Préfixe de base de données pour les tables de WordPress.
 *
 * Vous pouvez installer plusieurs WordPress sur une seule base de données
 * si vous leur donnez chacune un préfixe unique.
 * N’utilisez que des chiffres, des lettres non-accentuées, et des caractères soulignés !
 */
$table_prefix = getenv('WORDPRESS_TABLE_PREFIX');

/**
 * Pour les développeurs : le mode déboguage de WordPress.
 *
 * En passant la valeur suivante à "true", vous activez l’affichage des
 * notifications d’erreurs pendant vos essais.
 * Il est fortement recommandé que les développeurs d’extensions et
 * de thèmes se servent de WP_DEBUG dans leur environnement de
 * développement.
 *
 * Pour plus d’information sur les autres constantes qui peuvent être utilisées
 * pour le déboguage, rendez-vous sur le Codex.
 *
 * @link https://fr.wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* C’est tout, ne touchez pas à ce qui suit ! Bonne publication. */

/** Chemin absolu vers le dossier de WordPress. */
if ( ! defined( 'ABSPATH' ) )
  define( 'ABSPATH', dirname( __FILE__ ) . '/' );

/** Réglage des variables de WordPress et de ses fichiers inclus. */
require_once( ABSPATH . 'wp-settings.php' );

/**#@+
 * Clés uniques d’authentification et salage.
 *
 * Les Clés sont remplacer par le fichier salt.php grace a l'include si dessous
 * 
 * @since 2.6.0
*	
*	define( 'AUTH_KEY',         'mettez une phrase unique ici' );
*	define( 'SECURE_AUTH_KEY',  'mettez une phrase unique ici' );
*	define( 'LOGGED_IN_KEY',    'mettez une phrase unique ici' );
*	define( 'NONCE_KEY',        'mettez une phrase unique ici' );
*	define( 'AUTH_SALT',        'mettez une phrase unique ici' );
*	define( 'SECURE_AUTH_SALT', 'mettez une phrase unique ici' );
*	define( 'LOGGED_IN_SALT',   'mettez une phrase unique ici' );
*	define( 'NONCE_SALT',       'mettez une phrase unique ici' );
**#@-*/

include 'salt.php'
