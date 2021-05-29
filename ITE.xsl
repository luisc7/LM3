<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/">
        <html>
            <head>
                <meta charset="UTF-8"/>
                <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
                <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

                <link rel="stylesheet" media="screen" href="css/stylestd.css"/>

                <title><xsl:value-of select="ite/@nombre"/></title>
            </head>

            <body class="fondo">

                <!--img src="img/pexels-photo-3769021.webp" class="fondo" alt="fondo_web"/-->

                <header id="cabecera">
                    <img src="img/logo_edix.svg" alt="logo"/>
                    <h1>
                        <xsl:element name="a">
                            <xsl:attribute name="href">
                                <xsl:value-of select="ite/@web"/>
                            </xsl:attribute>
                                <xsl:value-of select="ite/@nombre"/>
                        </xsl:element>
                    </h1>
                </header>

                <nav class="collapsable-menu">
                    <div class="menu-content">
                        <ul class="lista-menu">
                            <li class="menulink" id="home"> <a href="index.html">Sobre Edix</a> </li>
                            <li class="menulink" id="cursos"> <a href="cursos.html" id="actual">Cursos</a> </li>
                            <li class="menulink" id="fp"> <a href="fp.html">Formación Profesional</a> </li>
                            <li class="menulink" id="metodo"> <a href="metodo.html">Metodología</a> </li>
                            <li class="menulink" id="empresas"> <a href="empresas.html">Empresas colaboradoras</a> </li>
                        </ul>
                    </div>
                </nav>

                <section>
                    <header>
                        <h2>Ciclos Formativos de Grado Superior de Informática</h2>
                    </header>

                    <article class="intro">
                        <h3>Sé parte de la digitalización, desde dentro</h3>
                        <p>
                            En Edix estamos especializados en formación online de perfiles digitales.
                        </p>
                    </article>

                    <article class="cfgs descripcion">
                        <h3>Además, ahora podrás hacerlo cursando titulaciones oficiales en CFGS de la rama informática</h3>
                        <table>
                            <thead>
                                <tr>
                                    <th>Denominación</th>
                                    <th>Nombre</th>
                                    <th>Tipo de grado</th>
                                    <th>Año de creación</th>
                                </tr>
                            </thead>
                            <tbody>
                                <xsl:for-each select="ite/ciclos/ciclo">
                                    <tr>
                                        <td class="col1"><xsl:value-of select="@id"/></td>
                                        <td class="col2"><xsl:value-of select="nombre"/></td>
                                        <td class="col3"><xsl:value-of select="grado"/></td>
                                        <td class="col4"><xsl:value-of select="decretoTitulo/@año"/></td>
                                    </tr>
                                </xsl:for-each>
                            </tbody>
                        </table>
                    </article>

                    <article class="descripcion equipo">
                        <h3>Nuestro equipo</h3>
                        <p>Contarás la variada experiencia de nuestro equipo para tu formación:</p>
                        <p>Serán<xsl:for-each select="ite/profesores/profesor">
                            o <span class="negrita"><xsl:value-of select="nombre"/></span>
                        </xsl:for-each> los que impartirán las clases de contenido técnico.</p>
                        <table>
                            <caption><h4>Equipo directivo</h4></caption>
                            <thead>
                                <tr>
                                    <th>Cargo</th>
                                    <th>Nombre</th>
                                    <th>Despacho</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>Director/a</td>
                                    <td><xsl:value-of select="ite/director/nombre"/></td>
                                    <td><xsl:value-of select="ite/director/despacho"/></td>
                                </tr>
                                <tr>
                                    <td>Jefe de estudios</td>
                                    <td><xsl:value-of select="ite/jefe_estudios/nombre"/></td>
                                    <td><xsl:value-of select="ite/jefe_estudios/despacho"/></td>
                                </tr>
                            </tbody>
                        </table>
                    </article>

                    <article class="descripcion formulario">
                        <h3>Solicita más información</h3>
                        <p>Si deseas inscribirte o solicitar más información, rellena tus datos a continuación y estaremos encantados de resolver tus dudas.</p>
                        <form method="get" action="mailto:midireccion@decorreo.es">
                            <fieldset><legend>¡Pregúntanos!</legend>
                                <div class="grid-container">
                                <label for="curso">Elige de qué curso deseas informarte</label>
                                <select name="curso">
                                    <xsl:for-each select="ite/ciclos/ciclo">
                                        <xsl:element name="option">
                                            <xsl:attribute name="value">
                                                <xsl:value-of select="@id"/>
                                            </xsl:attribute>
                                            <xsl:value-of select="nombre"/>
                                        </xsl:element>
                                    </xsl:for-each>
                                    <option value="otros" selected="selected">Otros (preguntas generales)</option>
                                </select>
                                <label for="detalles">Danos más detalles </label>
                                <input type="text" name="detalles" placeholder="(Opcional)"/>
                                <label for="email">Correo electrónico de contacto</label>
                                <input type="email" name="correo" placeholder="Tu email" required="required"/>
                                <label for="telf">Teléfono de contacto</label>
                                <input type="tel" name="telf" placeholder="(Opcional)"/>
                            </div>
                                <input class="button" type="submit" value="Solicitar información"/>
                                

                            </fieldset>
                        </form>
                    </article>
                </section>

                <footer>
                </footer>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>