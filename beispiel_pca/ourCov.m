function [C]=ourCov(D)
%D=D';
[n,d]=size(D);
mm=mean(D);
for i=1:d
    for j=1:d
        temp=0;
        for k=1:n
        temp=temp+((D(k,i)-mm(i))*(D(k,j)-mm(j)));
        if k==n;
            temp=temp/(n-1);
            C(i,j)=temp;
        end  
        end
    end
end