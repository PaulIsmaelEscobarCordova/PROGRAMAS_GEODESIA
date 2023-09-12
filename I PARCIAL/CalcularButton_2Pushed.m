function CalcularButton_2Pushed(app, event)
            % Conversión de Cordenadas Geodésicas a Cartesianas
            % Información Preliminar.
            % GRS 80 SISTEMA GEODÉSICO DEL ECUADOR
            format long
            a= 6378137.0;
            f= 1/298.257222101;
            % wgs 84
            a1= 6378137.0;
            f1= 1/298.257223563;
            % HAYFORD
            a2= 6378388;
            f2=1/297;
            % ********** EFECTUACION DE LOS CALCULOS**********************
            e1= 2*(f)-(f)^2; 
            N=(a)/(sqrt(1-e1*sind(app.latitud)^2));
            X=(N+app.altura)*cosd(app.latitud)*cosd(app.longitud);
            round(X)
            %X1=round(X,12,"significant");
            Y=(N+app.altura)*cosd(app.latitud)*sind(app.longitud);
            round(Y)
            %Y1=round(Y,12,"significant");
            Z=((1-e1)*N+app.altura)*sind(app.latitud);
             round(Z)
            %Z1=round(Z,12,"significant");
                        
            % Formatear los números con 5 decimales
            X_str = sprintf('%.5f', X);
            Y_str = sprintf('%.5f', Y);
            Z_str = sprintf('%.5f', Z);
               
                       
            app.xEditField_3.Value = X_str;
            app.yEditField_3.Value = Y_str;
            app.zEditField_3.Value = Z_str;
             
        end