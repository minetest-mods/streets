(
	define
	(
		script-fu-streets-signs
		filename
		inputColors
	)
	(
		let*
		(
			( image ( car ( file-png-load 1 filename filename ) ) )
			( drawable ( car ( gimp-image-get-active-layer image ) ) )
			( numberOfFixedColors 0)
			( fixedColors 0 )
			( sizeFactor 1 )
			( colorId 0 )
			( colormapCounter 0 )
			( colormap '(0 0) )
			( colors '() )
			( colormapSize 0 )
			( colormapColors 0 )
			( colormapColorsNew 0 )
			( stringlength ( string-length inputColors ) )
			( stringindex 0 )
		)

		(
			while ( < stringindex stringlength )
			(
				begin
				(
					cond
					(
						(
							or
							(
								and
								( char-ci>=? ( string-ref inputColors stringindex ) #\a )
								( char-ci<=? ( string-ref inputColors stringindex ) #\f )
							)
							(
								and
								( char-ci>=? ( string-ref inputColors stringindex ) #\0 )
								( char-ci<=? ( string-ref inputColors stringindex ) #\9 )
							)
						)
						( set! numberOfFixedColors ( + numberOfFixedColors 1 ) )
						( set! stringindex ( + stringindex 5 ) )
					)
				)
				( set! stringindex ( + stringindex 1 ) )
			)
		)

		( set! fixedColors ( make-vector numberOfFixedColors ) )
		( set! stringindex 0 )
		( set! numberOfFixedColors 0 )

		(
			while ( < stringindex stringlength )
			(
				begin
				(
					cond
					(
						(
							or
							(
								and
								( char-ci>=? ( string-ref inputColors stringindex ) #\a )
								( char-ci<=? ( string-ref inputColors stringindex ) #\f )
							)
							(
								and
								( char-ci>=? ( string-ref inputColors stringindex ) #\0 )
								( char-ci<=? ( string-ref inputColors stringindex ) #\9 )
							)
						)


						(
							vector-set!
							fixedColors
							numberOfFixedColors
							(
								list
								( string->number ( string-append "#x" ( substring inputColors ( + stringindex 0 ) ( + stringindex 2 ) ) ) )
								( string->number ( string-append "#x" ( substring inputColors ( + stringindex 2 ) ( + stringindex 4 ) ) ) )
								( string->number ( string-append "#x" ( substring inputColors ( + stringindex 4 ) ( + stringindex 6 ) ) ) )
							)
						)
						( set! stringindex ( + stringindex 5 ) )
						( set! numberOfFixedColors ( + numberOfFixedColors 1 ) )
					)
				)
				( set! stringindex ( + stringindex 1 ) )
			)
		)

		( gimp-context-set-sample-threshold 0 )
		( gimp-selection-none image )

		( gimp-edit-copy drawable )

		(
			while ( < colorId numberOfFixedColors )
			(
				begin
				( gimp-image-select-color image CHANNEL-OP-REPLACE drawable ( vector-ref fixedColors colorId ) )
				( gimp-edit-clear drawable )
				( set! colors ( append colors ( vector-ref fixedColors colorId ) ))
				( set! colorId ( + colorId 1 ) )
			)
		)


		( gimp-image-convert-indexed image 0 0 ( - 64 numberOfFixedColors ) 0 0 "" )

		( set! colormap ( gimp-image-get-colormap image ) )
		( set! colormapSize ( car colormap ) )
		( set! colormapColors ( cadr colormap ) )


		( set! colormapColorsNew ( make-vector ( + colormapSize ( * 3 numberOfFixedColors ) ) ) )


		(
			while ( < colormapCounter colormapSize)
			(
				begin
				( vector-set! colormapColorsNew colormapCounter ( vector-ref colormapColors colormapCounter ) )
				( set! colormapCounter ( + colormapCounter 1 ) )
			)
		)

		(
			while ( < colormapCounter ( + colormapSize ( * 3 numberOfFixedColors ) ) )
			(
				begin
				( vector-set! colormapColorsNew colormapCounter ( car colors ) )
				( set! colors ( cdr colors ) )
				( set! colormapCounter ( + colormapCounter 1 ) )
			)
		)

		( gimp-image-set-colormap image colormapCounter colormapColorsNew )
		( gimp-selection-none image )
		( gimp-edit-clear drawable )
		(
			gimp-image-resize
			image
			( * sizeFactor 250 )
			( * sizeFactor 250 )
			( / ( - ( * sizeFactor 250 ) ( car ( gimp-image-width image ) ) ) 2 )
			( / ( - ( * sizeFactor 250 ) ( car ( gimp-image-height image ) ) ) 2 )
		)
		( gimp-layer-resize-to-image-size ( car ( gimp-image-get-active-layer image ) ) )
		( gimp-floating-sel-anchor ( car ( gimp-edit-paste drawable 1 ) ) )
		( set! drawable ( car ( gimp-image-get-active-layer image ) ) )
		( file-png-save2 RUN-NONINTERACTIVE image drawable filename filename 0 9 0 0 0 0 0 0 0 )
	)
)