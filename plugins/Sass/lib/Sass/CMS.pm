package Sass::CMS;

use strict;
use warnings;

use MT;

our $plugin = MT->component( 'Sass' );

sub hdlr_install_sass_templates {
    my $app = shift;

    my $blog_id = $app->param( 'blog_id' );
    my $blog = $blog_id ? MT->model( 'blog' )->load( $blog_id ) : undef;
    return $app->error( 'Invalid Request.' ) unless $blog;

    my $template_class = MT->model( 'template' );

    my %targets = ( '_sass.php.tmpl' => { identifier => 'sass_compiler', name => 'Sass compiler', outfile => ".sass.php" },
                    '_htaccess.tmpl' => { identifier => 'sass_htaccess', name => 'Sass .htaccess', outfile => ".htaccess" } );
    foreach my $fname ( keys %targets ) {
        my $data = $targets{$fname};
        my %terms = ( blog_id => $blog->id,
                      identifier => $data->{identifier} );
        my %args = ( limit => 1 );
        my $template = $template_class->load( \%terms, \%args );
        next if defined $template;

        my $name = $data->{name};
        if ( $template_class->exist( { name => $name,
                                       blog_id => $blog->id } ) ) {
            my $i = 0;
            my $new_name = $name . ' (' . ++$i . ')';
            while ( MT::Template->exist({ name => $new_name,
                                          blog_id => $blog->id } ) ) {
                $new_name = $name . ' (' . ++$i . ')';
            }
            $name = $new_name;
        }

        $template = $template_class->new;
        $template->blog_id( $blog->id );
        $template->identifier( $data->{identifier} );
        $template->name( $name );
        $template->outfile( $data->{outfile} );
        $template->build_type( 1 );
        $template->rebuild_me( 1 );
        $template->text( _load_tmpl( $fname ) );
        $template->type( 'index' );

        $template->save or
          return $app->error( $template->errstr );

    }

    $app->load_tmpl( 'installed_sass_templates.tmpl' );
}

sub _load_tmpl {
    my ( $fname ) = @_;
    my $path = File::Spec->catfile( $plugin->path, 'tmpl', $fname );
    return undef unless -f $path;
    open FILE, "<$path";
    my @lines = <FILE>;
    close FILE;
    $plugin->translate_templatized( join( '', @lines ) );
}

1;
