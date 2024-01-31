//
//  TitleRow.swift
//  ChatAppDemo
//
//  Created by Tuan Cai on 1/30/24.
//

import SwiftUI

struct TitleRow: View {
    var body: some View {
        HStack(spacing: 20) {
            AsyncImage(url: URL(string: "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/394.jpg")) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: 50)
                    .cornerRadius(50)
            } placeholder: {
                ProgressView()
            }
            
            VStack(alignment: .leading) {
                Text("Long Lam")
                    .font(.system(size: 30, weight: .bold))
                    .foregroundColor(.white)
                HStack {
                    Image(systemName: "circle.fill")
                        .foregroundColor(.green)
                        .font(.system(size: 13))
                        .shadow(radius: 2)
                    Text("Online")
                        .font(.caption)
                        .foregroundColor(.white)
                        
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
        }
        .padding()
    }
}

struct TitleRow_Previews: PreviewProvider {
    static var previews: some View {
        TitleRow()
            .background(Color(red: 0.6, green: 0.4, blue: 0.8))
    }
}
